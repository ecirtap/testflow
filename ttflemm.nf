#!/usr/bin/env nextflow

sentences=file(params.in)

process treetagger {
  container 'ecirtap/treetagger:3.2.3'
  cpus   1
  memory   '512M'
  
  input:
  file 'input.txt' from sentences

  output:
  stdout tt

  """
  tree-tagger-french input.txt
  """
}

process flemm {
  container 'ecirtap/flemm:3.1.1'
  containerOptions '--entrypoint=/bin/bash'
  cpus   1
  memory   '512M'

  input:
    stdin tt

  output:
    stdout result

  """
  perl /flemm/Flemmv31-3.1.1/flemm.pl --tagger treetagger
  """
}

result.view { it.trim() }
