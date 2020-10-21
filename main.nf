#!/usr/bin/env nextflow

Channel.fromPath("${params.s3_folder_pairs}/*{${params.file_suffix},${params.index_suffix}}")
       .map { it -> [ file(it).simpleName, it] }
       .groupTuple(by:0)
       .set { ch_pairs }

Channel.fromPath("${params.s3_folder_no_pairs}/*{${params.file_suffix},${params.index_suffix}}")
       .map { it -> [ file(it).simpleName, it] }
       .groupTuple(by:0)
       .set { ch_no_pairs }

process pairs {
  tag "PAIRS: simpleName:${name}, file(s):${file_or_pair_of_files}" 
  echo true

  input: 
  set val(name), file(file_or_pair_of_files) from  ch_pairs
  
  output: 
  file("${name}_fake_input.txt") into ch_force_serial

  script:
  """
  echo "when in pairs:"
  echo "simpleName:${name}\nfile(s):${file_or_pair_of_files}"
  echo "simpleName:${name}\nfile(s):${file_or_pair_of_files}" > "${name}_fake_input.txt"
  """
}

process no_pairs {
  tag "NOT PAIRS: simpleName:${name}, file(s):${file_or_pair_of_files}" 
  echo true

  input: 
  set val(name), file(file_or_pair_of_files) from  ch_no_pairs
  file(pseudo_dependency) from ch_force_serial

  script:
  """
  echo "when NO pairs:"
  echo "simpleName:${name}\nfile(s):${file_or_pair_of_files}"
  """
}
