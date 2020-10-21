#!/usr/bin/env nextflow

Channel
    .from(
      [1, "case_one"],
      [1, "case_two"],
      [0, "CTRL_ONE"],
      [0, "CTRL_TWO"])
    .branch {
        cases: it[0] == 1
        controls: it[0] == 0
    }
    .set { ch_input_files }

 ch_input_files.cases.dump(tag: 'cases')
 ch_input_files.controls.dump(tag: 'controls')

process echo_cases {
  tag "status:${status}, id:${id}" 
  
  input: 
  set val(status), val(id) from  ch_input_files.cases
  
  output: 
  file("${id}_fake_input.txt") into ch_force_serial

  script:
  """
  echo "status: $status\nid: $id" 
  echo "status: $status\nid: $id" > "${id}_fake_input.txt"
  """
}

process echo_controls {
  tag "status:${status}, id:${id}" 
  
  input: 
  set val(status), val(id) from  ch_input_files.controls
  file(pseudo_dependency) from ch_force_serial

  script:
  """
  echo "status: $status\nid: $id" 
  """
}
