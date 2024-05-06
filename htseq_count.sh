#!/bin/bash
dir=/student/spinjarla/courses/bcb5250/RNAseqs/chrX_data
files=$dir/hisat_out/*.bam
gtf_file=$dir/genes/chrX.gtf
for entry in $files
do
    echo $entry
    basename=$(basename $entry)
    sample_name=${basename%.bam}
    echo $sample_name
    htseq-count -f bam $entry $gtf_file > "$dir"/htseq_out/"$sample_name"_htseq_count.txt
done




