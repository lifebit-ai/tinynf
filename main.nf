Channel
    .fromFilePairs("${params.s3_folder}/*{csi,vcf.gz}")
    .view()
