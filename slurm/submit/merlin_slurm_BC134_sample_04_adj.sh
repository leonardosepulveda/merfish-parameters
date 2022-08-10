#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p zhuang,shared
#SBATCH -t 7-00:00:00
#SBATCH --mem 4000
#SBATCH --open-mode=append
#SBATCH -o /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/out/BC134_sample_04_adj.out
#SBATCH -e /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/err/BC134_sample_04_adj.err

date +'Starting at %R.'

source centos7-modules.sh
module load Anaconda3/5.0.1-fasrc01
source activate merlin_env
module load gcc/8.2.0-fasrc01
module load fftw
which python
echo BC134_sample_04_adj

merlin -k parameters_BC134.json \
       -a merlin_analysis_BC134.json \
       -o data_organization_BC134_4.csv \
       -p positions_BC134_sample_04_adj.txt \
       -c C2v6_codebook_mplx.csv \
       -m MERFISH8.json \
       -n 1000 \
       -e /n/holyscratch01/zhuang_lab/Users/lsepulvedaduran/data \
       -s /n/holyscratch01/zhuang_lab/Users/lsepulvedaduran/analysis \
       BC134/sample_04

date +'Finished at %R.'
