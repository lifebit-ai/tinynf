#!/usr/bin/env nextflow

ch_names   = Channel.from( ['a', 'file1'], ['b','file2'] )
(ch_names_tuple, ch_names_set) = ch_names.into(2)

process output_tuple {

  input:
  tuple val(id), val(name) from ch_names_tuple

  output:
  tuple val(id), file("${name}.txt") into ch_tuple

  script:
  """
  echo Creating $id
  touch ${name}.txt
  """
}

ch_tuple.view()

process output_set {

  input:
  tuple val(id), val(name) from ch_names_set

  output:
  set val(id), file("${name}.txt") into ch_set

  script:
  """
  echo Creating $id
  touch ${name}.txt
  """
}

ch_set.view()