#!/usr/bin/env nextflow

// Create the channel for the fasta file if provided
if (params.with_scratch_process_file)  {ch_with_scratch_process_file = Channel.value(file(params.with_scratch_process_file, checkIfExists: true)) }
if (params.no_scratch_process_file)     {ch_no_scratch_process_file = Channel.value(file(params.no_scratch_process_file, checkIfExists: true)) }

ch_fake_param = [1, 2, 3, 4]
ch_very_fake_param = ['a', 'b', 'c', 'd']

process with_scratch {

  input: 
  file(with_scratch_process_file) from ch_with_scratch_process_file
  val(fake_param) from ch_fake_param

  script:
  """
  echo $fake_param
  ls -l $with_scratch_process_file
  df -h ~
  tree -af /tmp
  """
}

process no_scratch {

  input: 
  file(no_scratch_process_file) from ch_no_scratch_process_file
  val(fake_param) from ch_very_fake_param
 
  script:
  """
  echo $fake_param
  ls -l $no_scratch_process_file
  df -h ~
  tree -af /tmp
  """
}
