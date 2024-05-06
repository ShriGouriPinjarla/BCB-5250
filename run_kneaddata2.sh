#!/bin/bash

dir=/student/spinjarla/courses/bcb5250/metagenomics_wgs/data/raw_data
files=$dir/*_R1.fastq

echo "Run script ---------------"
for FILE in $files
do
    echo "$FILE"
    basename "$FILE"
    FILENAME=$(basename -- "$FILE" _R1.fastq)
    echo $FILENAME
    ID=$(echo ${FILENAME}|sed 's/_R1.fastq//g')
    echo $ID
    kneaddata -i1 "$dir"/"$ID"_R1.fastq -i2 "$dir"/"$ID"_R2.fastq -o "$dir"/filtered_data/"$ID" -db /public/ahnt/courses/bcb5250/metagenomics_wgs/bowtie2db/hg37dec_v0.1 --trimmomatic /opt/Trimmomatic-0.39 -t 8 --trimmomatic-options "SLIDINGWINDOW:4:20 MINLEN:50" --bowtie2 /opt/bowtie2-2.4.2-linux-x86_64 --bowtie2-options "--very-sensitive --dovetail" --remove-intermediate-output --trf /public/ahnt/software
done

# Create filtered_data directory
#mkdir "$dir"/filtered_data

# Copy filtered files to filtered_data directory
for FILE in "$dir"/filtered_data/*_filtered_R1.fastq
do
    cp "$FILE" "$dir"/filtered_data/
    cp "${FILE/_R1.fastq/_R2.fastq}" "$dir"/filtered_data/
done

# Run FASTQC on pre-processed samples
fastqc "$dir"/filtered_data/*_filtered_R*.fastq -o "$dir"/filtered_data/fastqc_results
