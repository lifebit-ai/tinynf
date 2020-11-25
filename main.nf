#!/usr/bin/env nextflow

// Create the channel for the fasta file if provided
if (params.with_scratch_process_file)  {ch_with_scratch_process_file = Channel.value(file(params.with_scratch_process_file, checkIfExists: true)) }
if (params.no_scratch_process_file)     {ch_no_scratch_process_file = Channel.value(file(params.no_scratch_process_file, checkIfExists: true)) }

process with_scratch {

  input: 
  file(with_scratch_process_file) from ch_with_scratch_process_file

  script:
  """
  """
}

process no_scratch {

  input: 
  file(no_scratch_process_file) from ch_no_scratch_process_file
  
  script:
  """
  """
}
