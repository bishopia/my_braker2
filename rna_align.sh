#!/bin/bash

#SBATCH --time=1:00:00
#SBATCH --mem=40G #default is 1 core with 2.8GB of memory
#SBATCH -n 16
#SBATCH --account=epscor-condo

# Specify a job name:
#SBATCH -J rna_align

#----- End of slurm commands ----

source activate /users/ibishop/data/ibishop/condas/repeat_annotation

PROC=16
R1_FQ="$1"
R2_FQ="$2"
GENOME="$3"
DBDIR="$4"

#Trim with trimgalore!
trim_galore --paired ${R1_FQ} ${R2_FQ}

#Align with Hisat2!
#If aligning more than one set of RNAseq, build the database outside the script
hisat2-build ${GENOME} ${GENOME%.*}
hisat2 -p ${PROC} -x ${GENOME%.*} -1 ${R1_FQ%%.*}_val_1.fq -2 ${R2_FQ%%.*}_val_2.fq -S ${R1_FQ%.*}.sam

samtools view --threads ${PROC} -b -o ${R1_FQ%.*}.bam ${R1_FQ%.*}.sam
samtools sort -m 7G -o ${R1_FQ%.*}_sorted.bam -T ${R1_FQ%.*}_temp --threads ${PROC} ${R1_FQ%.*}.bam

#Check alignment quality with Picard!
java -jar ${DBDIR}/picard.jar CollectAlignmentSummaryMetrics  REFERENCE_SEQUENCE=${DBDIR}/${GENOME} INPUT=${R1_FQ%.*}_sorted.bam OUTPUT=${R1_FQ%.*}.bam_alignment.stats
