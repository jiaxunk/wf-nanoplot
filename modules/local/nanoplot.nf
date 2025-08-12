process NANOPLOT {
    label 'nanoplot'
    container 'quay.io/biocontainers/nanoplot:1.40.0--pyhdfd78af_0'
    cpus 2
    publishDir "${params.out_dir}", mode: 'copy'

    input:
        tuple val(meta), path("reads.fastq.gz")
    
    output:
        tuple val(meta), 
            path("${meta.alias}.NanoPlot-report.html"),
            path("${meta.alias}.NanoStats.txt")

    script:
    """
    NanoPlot --fastq reads.fastq.gz --outdir output
    mv output/NanoPlot-report.html "./${meta.alias}.NanoPlot-report.html"
    mv output/NanoStats.txt "./${meta.alias}.NanoStats.txt"
    """
}