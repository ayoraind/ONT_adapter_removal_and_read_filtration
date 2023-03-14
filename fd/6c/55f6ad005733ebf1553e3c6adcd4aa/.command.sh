#!/bin/bash -ue
porechop \
    -i T084-9-A_G230209.fastq.gz \
    -t 1 \
    --format fastq \
    -o T084-9-A_G230209.PORECHOP.fastq \
    > T084-9-A_G230209.log

cat <<-END_VERSIONS > versions.yml
"PORECHOP":
    porechop: $( porechop --version )
END_VERSIONS

# gzip output
gzip T084-9-A_G230209.PORECHOP.fastq
