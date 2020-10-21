#!/usr/bin/env nextflow

// ch_pairs = Channel.fromFilePairs("${params.s3_folder_pairs}/*{vcf.gz,vcf.gz.csi}", flat: true, checkIfExists: true)
// ch_no_pairs = Channel.fromFilePairs("${params.s3_folder_no_pairs}/*{vcf.gz,vcf.gz.csi}", flat: true, checkIfExists: true)



// ch_pairs.view()
// ch_no_pairs.view()


Channel.fromPath("${params.s3_folder_pairs}/*{vcf.gz,vcf.gz.csi}").map { it -> [ file(it).simpleName, it] }.groupBy {by:it[0]}[0].view()

ch_no_pairs = Channel.fromPath("${params.s3_folder_no_pairs}/*{vcf.gz,vcf.gz.csi}")


