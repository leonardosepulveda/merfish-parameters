#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p zhuang
#SBATCH -t 7-00:00:00
#SBATCH --mem 4000
#SBATCH --open-mode=append
#SBATCH -o /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/out/BC196_sample_LS_C_brain.out
#SBATCH -e /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/err/BC196_sample_LS_C_brain.err

date +'Starting at %R.'

source centos7-modules.sh
module load Anaconda3/5.0.1-fasrc01
source activate merlin_env
module load gcc/8.2.0-fasrc01
module load fftw
which python
echo BC196_sample_LS_C_brain

merlin -k parameters_BC196.json \
       -a merlin_analysis_BC196.json \
       -o data_organization_BC196_brain.csv \
       -p positions_BC196_sample_LS_C_brain.txt \
       -c MO4E4_codebook.csv \
       -m MERFISH3.json \
       -n 1000 \
       -e /n/holyscratch01/zhuang_lab/Users/lsepulvedaduran/data \
       -s /n/holyscratch01/zhuang_lab/Users/lsepulvedaduran/analysis \
       220802_BC196_data/sample_LS_C_brain

date +'Finished at %R.'
