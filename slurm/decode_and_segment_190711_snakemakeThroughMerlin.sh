#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p zhuang,shared
#SBATCH -t 7-00:00:00
#SBATCH --mem 16000
#SBATCH --open-mode=append
#SBATCH -o /n/home07/blosser/lib/MERlin/lib/MERlin_snakemake/out/%j.stdout.txt
#SBATCH -e /n/home07/blosser/lib/MERlin/lib/MERlin_snakemake/out/%j.stdout.txt

date +'Starting at %R.'

source activate merlin_env
module load gcc/8.2.0-fasrc01
module load fftw
which python
echo 190711_M2-1

merlin -k defaultParameters.json -a NAc_decode_and_segment_AllTasks.json -e /n/boslfs/LABS/zhuang_lab/Everyone/NAc/MERFISH_data/ -o NAc_190711_data_organization.csv -p positions_190711.txt -c NacM1E1_codebook.csv -m MERFISH3.json 190711_M2-1/data

date +'Finished at %R.'
