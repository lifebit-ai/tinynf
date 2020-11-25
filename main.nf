#!/usr/bin/env nextflow

Channel
    .fromPath(file(params.input))
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
  ls -l $input
  df -h ~
  tree -f ~ | grep ${params.path_pattern} | head -1
  """
}
