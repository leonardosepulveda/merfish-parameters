#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 5000
#SBATCH --mem 2000
#SBATCH --open-mode=append
#SBATCH -o /home/leonardosepulveda/merfish-parameters/slurm/out/BC071_sample_01_gcloud.out
#SBATCH -e /home/leonardosepulveda/merfish-parameters/slurm/err/BC071_sample_01_gcloud.err

date +'Starting at %R.'

echo BC071_sample_01

merlin -k snakemake_parameters_gcloud.json \
       -a merlin_analysis_BC071_gcloud.json \
       -o data_organization_BC071.csv \
       -p positions_BC071_sample_01.txt \
       -c C1E1_codebook.csv \
       -m MERFISH3.json \
       -n 1000 \
       191212_BC071_MERFISH/sample_01

date +'Finished at %R.'