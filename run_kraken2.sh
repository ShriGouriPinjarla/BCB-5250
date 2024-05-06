#!/bin/bash

# Set the directory containing the filtered data
dir="/student/spinjarla/courses/bcb5250/metagenomics_wgs/data/filtered_data2"
filtered_data_dir="$dir/filtered_data"

# Set the paths for Kraken2 and its database
kraken2_path="/public/ahnt/software/kraken2/kraken2"
kraken2_db="/public/ahnt/courses/bcb5250/metagenomics_wgs/k2_standard_8gb_20210517"

# Create the output directory
kraken2_out_dir="$dir/kraken2_out"
mkdir -p "$kraken2_out_dir"

# Loop through each filtered sample
for sample in "$filtered_data_dir"/*_R1.fastq; do
    # Extract the sample name
   # sample_name=$(basename "$sample" _R1.fastq)
    sample_name=$(basename "$forward_read" _R1.fastq)	

    # Run Kraken2 on the filtered sample
    "$kraken2_path" --db "$kraken2_db" --confidence 0.1 --threads 8 --use-names \
        --output "$kraken2_out_dir/${sample_name}_kraken2.out" \
        --report "$kraken2_out_dir/${sample_name}_kraken2.report" \
        --paired "${sample}" "${filtered_data_dir}/${sample_name}_R2.fastq"
done
