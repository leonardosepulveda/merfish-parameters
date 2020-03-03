#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 7-00:00:00
#SBATCH --mem 2000
#SBATCH --open-mode=append
#SBATCH -o /home/lsepulvedaduran_g_harvard_edu/merfish-parameters/slurm/out/BC071_sample_06_gcloud.out
#SBATCH -e /home/lsepulvedaduran_g_harvard_edu/merfish-parameters/slurm/err/BC071_sample_06_gcloud.err

date +'Starting at %R.'

source activate merlin_env

merlin -k snakemake_parameters_gcloud.json \
       -a merlin_analysis_BC071_gcloud.json \
       -o data_organization_BC071_2.csv \
       -p positions_BC071_sample_06.txt \
       -c C1E1_codebook.csv \
       -m MERFISH3.json \
       -n 1000 \
       191212_BC071_MERFISH/sample_06

date +'Finished at %R.'
