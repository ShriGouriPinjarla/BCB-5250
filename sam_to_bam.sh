#!/bin/bash

# Path to HISAT2 output directory
hisat_out_path="/student/spinjarla/courses/bcb5250/RNAseq/chrX_data/samples/hisat_out"

# Print header
echo "Convert SAM to Sorted BAM format:"
echo ""
echo "Samtools is available at /usr/bin/samtools."
echo ""

# Loop through each summary file
for summary_file in "${hisat_out_path}"/*_summary.txt; do
    # Extract the sample ID from the summary file name
    sample_id=$(basename "$summary_file" _summary.txt)

    # Construct the input SAM file path
    sam_file="${hisat_out_path}/${sample_id}_chrX.sam"

    # Construct the output BAM file path
    bam_file="${sample_id}_chrX.bam"

    # Print the command to convert SAM to sorted BAM format
    echo "samtools sort -@ 8 -o $bam_file $sam_file"
done
~
