#!/bin/bash

# Define HISAT2 path
HISAT2_PATH="/opt/hisat2-2.2.0/hisat2"

# Define sample details
samples=("ERR188044" "ERR188104" "ERR188234" "ERR188245" "ERR188257" "ERR188273" "ERR188337" "ERR188383" "ERR188401" "ERR188428" "ERR188454" "ERR204916")

# Run HISAT2 for each sample
for sample in "${samples[@]}"; do
    # Construct HISAT2 command and append it to the summary file
    echo "HISAT2 Command: $HISAT2_PATH -p 8 --dta -x indexes/chrX_tran -1 samples/${sample}_chrX_1.fastq.gz -2 samples/${sample}_chrX_2.fastq.gz -S hisat_out/${sample}_chrX.sam" >> hisat_out/${sample}_summary.txt
    
    # Execute HISAT2
    $HISAT2_PATH -p 8 --dta -x indexes/chrX_tran -1 samples/${sample}_chrX_1.fastq.gz -2 samples/${sample}_chrX_2.fastq.gz -S hisat_out/${sample}_chrX.sam >> hisat_out/${sample}_summary.txt
done

~
