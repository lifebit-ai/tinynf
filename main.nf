#!/usr/bin/env nextflow

Channel
    .fromPath(params.input)
    .ifEmpty { exit 1, "Input .csv file is not found at ${params.input}. Is the file path correct?"}
    .splitCsv()
    .flatten()
    .set{ ch_input }

process stage_file {
  tag "${input}"
  echo true

  input: 
  file(input) from ch_input

  script:
  """
  df -h ~
  tree -f ~
  """
}
