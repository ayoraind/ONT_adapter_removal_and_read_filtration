#!/bin/bash -ue
porechop \
    -i T083-9-A_G230209.fastq.gz \
    -t 1 \
    --format fastq \
    -o T083-9-A_G230209.PORECHOP.fastq \
    > T083-9-A_G230209.log

cat <<-END_VERSIONS > versions.yml
"PORECHOP":
    porechop: $( porechop --version )
END_VERSIONS

# gzip output
gzip T083-9-A_G230209.PORECHOP.fastq
