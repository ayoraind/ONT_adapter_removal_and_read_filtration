#!/usr/bin/env nextflow

nextflow.enable.dsl=2

// include definitions
include  { helpMessage; Version } from './modules/messages.nf'

// include processes
include { PORECHOP; FILTLONG } from './modules/processes.nf'


log.info """\
    ONT PREPROCESSING  - TAPIR   P I P E L I N E
    ============================================
    output_dir       : ${params.output_dir}
    """
    .stripIndent()

/*
 * define the `index` process that creates a binary index
 * given the transcriptome file
 */


workflow {
         reads_ch = channel
                          .fromPath( params.reads, checkIfExists: true )
                          .map { file -> tuple(file.simpleName, file) }

    PORECHOP(reads_ch)
    FILTLONG(PORECHOP.out.fastqs_ch)

}
