## Workflow to remove adapter from uncorrected long reads, filter reads, and produce a longer, better subset.
### Usage

```

===================================================================
 Adapter Removal and Read Filtration: TAPIR Pipeline version 1.0dev
===================================================================
 The typical command for running the pipeline is as follows:
        nextflow run main.nf --reads "PathToReadFile(s)" --output_dir "PathToOutputDir" 

        Mandatory arguments:
         --reads                        Query fastqz file of sequences you wish to supply as input (e.g., "/MIGE/01_DATA/01_FASTQ/T055-8-*.fastq.gz")
         --output_dir                   Output directory to place output reads (e.g., "/MIGE/01_DATA/01_FASTQ")
         
        Optional arguments:
         --help                         This usage statement.
         --version                      Version statement

```


## Introduction
This pipeline removes adapters from raw reads, filters reads, and selects a longer, better subset. This Nextflow pipeline was adapted from NF Core's [Porechop module](https://github.com/nf-core/modules/tree/master/modules/nf-core/porechop/porechop), and the NF Core's [Filtlong Module](https://github.com/nf-core/modules/tree/master/modules/nf-core/filtlong).  


## Sample command
An example of a command to run this pipeline is:

```
nextflow run main.nf --reads "Sample_files/*.fastq.gz" --output_dir "test2" 
```

## Word of Note
This is an ongoing project at the Microbial Genome Analysis Group, Institute for Infection Prevention and Hospital Epidemiology, Üniversitätsklinikum, Freiburg. The project is funded by BMBF, Germany, and is led by [Dr. Sandra Reuter](https://www.uniklinik-freiburg.de/iuk-en/infection-prevention-and-hospital-epidemiology/research-group-reuter.html).


## Authors and acknowledgment
The TAPIR (Track Acquisition of Pathogens In Real-time) team.
