process PORECHOP {
    tag "Porechop on $sample_id"

    conda "../porechop_filtlong_env.yml"

    input:
    tuple val(sample_id), path(reads)

    output:
    tuple val(sample_id), path("*.fastq.gz"), emit: fastqs_ch
    tuple val(sample_id), path("*.log"),      emit: log_ch
    path "versions.yml",                      emit: versions_ch

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''
    def prefix = task.ext.prefix ?: "${sample_id}"

    """
    porechop \\
        -i ${reads} \\
        -t ${task.cpus} \\
        --format fastq \\
        -o ${sample_id}.PORECHOP.fastq \\
        > ${sample_id}.log

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        porechop: \$( porechop --version )
    END_VERSIONS

    # gzip output
    gzip ${sample_id}.PORECHOP.fastq

    """
}


process FILTLONG {
    publishDir "${params.output_dir}", mode:'copy'
    tag "Filtlong on $sample_id"

    conda "../porechop_filtlong_env.yml"


    input:
    tuple val(sample_id), path(reads)

    output:
    tuple val(sample_id), path("*.fastq.gz"), emit: fastqsfilt_ch
    tuple val(sample_id), path("*.log"), emit: logfilt_ch
    path "versions.yml"                 , emit: versionsfilt_ch

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''
    def prefix = task.ext.prefix ?: "${sample_id}"
    if ("$reads" == "${prefix}.fastq.gz") error "Read FASTQ input and output names are the same, set prefix in module configuration to disambiguate!"
    """
    filtlong \\
        $args \\
        --min_length 1000 \\
        --keep_percent 90 \\
        --target_bases 1000000000 \\
        $reads \\
        2> ${prefix}.log \\
        | gzip -n > ${prefix}.FILTLONG.fastq.gz
    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        filtlong: \$( filtlong --version | sed -e "s/Filtlong v//g" )
    END_VERSIONS
    """
}
