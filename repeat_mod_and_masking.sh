#!/bin/bash

#SBATCH --time=2:00:00
#SBATCH --mem=40G #default is 1 core with 2.8GB of memory
#SBATCH -n 16
#SBATCH --account=epscor-condo
#SBATCH -J repeat_model

#----- End of slurm commands ----

source activate /users/ibishop/data/ibishop/condas/repeat_annotation

BuildDatabase -name DB -engine ncbi ref_euk.fa

RepeatModeler -database DB -engine ncbi -pa 16

RepeatMasker -pa 16 -gff -nolow -xsmall -lib RM_197036.MonAug232315132021/consensi.fa.classified ref_euk.fa
