#!/usr/bin/env nextflow

// Create the channel for the fasta file if provided
if (params.local_file)  {ch_local_file = Channel.value(file(params.local_file, checkIfExists: true)) }
if (params.https_file)  {ch_https_file = Channel.value(file(params.https_file, checkIfExists: true)) }
if (params.s3_file)     {ch_s3_file = Channel.value(file(params.s3_file, checkIfExists: true)) }

if (params.local_file)  {ch_val_local_file = Channel.value(params.local_file) }
if (params.https_file)  {ch_val_https_file = Channel.value(params.https_file) }
if (params.s3_file)     {ch_val_s3_file = Channel.value(params.s3_file) }

process local {
  tag "local file: ${local_file}" 
  echo true

  input: 
  file(local_file) from ch_local_file
  
  script:
  """
  ls -L
  """
}

process https {
  tag "https file: ${https_file}" 
  echo true

  input: 
  file(https_file) from ch_https_file
  
  script:
  """
  ls -L
  """
}

process s3 {
  tag "s3 file: ${s3_file}" 
  echo true

  input: 
  file(s3_file) from ch_s3_file
  
  script:
  """
  ls -L
  """
}



process local_as_val {
  tag "local file: ${local_file}" 
  echo true

  input: 
  file(local_file) from ch_val_local_file
  
  script:
  """
  ls -L
  """
}

process https_as_val {
  tag "https file: ${https_file}" 
  echo true

  input: 
  file(https_file) from ch_val_https_file
  
  script:
  """
  ls -L
  """
}

process s3_as_val {
  tag "s3 file: ${s3_file}" 
  echo true

  input: 
  file(s3_file) from ch_val_s3_file
  
  script:
  """
  ls -L
  """
}

