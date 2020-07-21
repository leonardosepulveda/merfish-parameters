#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p zhuang,shared
#SBATCH -t 7-00:00:00
#SBATCH --mem 4000
#SBATCH --open-mode=append
#SBATCH -o /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/out/CC039_sample_01.out
#SBATCH -e /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/err/CC039_sample_01.err

date +'Starting at %R.'

source centos7-modules.sh
module load Anaconda3/5.0.1-fasrc01
source activate merlin_env
module load gcc/8.2.0-fasrc01
module load fftw
which python
echo CC039_sample_01

merlin -k parameters_CC039.json \
       -a merlin_analysis_CC039.json \
       -o data_organization_CC039.csv \
       -p positions_CC039_sample_01.txt \
       -c C1E1_codebook.csv \
       -m MERFISH3.json \
       -n 1000 \
       200706_CC039_MERFISH/sample_01

date +'Finished at %R.'
