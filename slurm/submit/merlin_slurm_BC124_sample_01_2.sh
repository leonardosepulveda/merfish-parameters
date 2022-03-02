#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p zhuang,shared
#SBATCH -t 7-00:00:00
#SBATCH --mem 4000
#SBATCH --open-mode=append
#SBATCH -o /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/out/BC124_sample_01_2.out
#SBATCH -e /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/err/BC124_sample_01_2.err

date +'Starting at %R.'

source centos7-modules.sh
module load Anaconda3/5.0.1-fasrc01
source activate merlin_env
module load gcc/8.2.0-fasrc01
module load fftw
which python
echo BC124_sample_01_2

merlin -k parameters_BC124.json \
       -a merlin_analysis_BC124.json \
       -o data_organization_BC124_2.csv \
       -p positions_BC124_sample_01.txt \
       -c C2v6_codebook_mplx.csv \
       -m MERFISH8.json \
       -n 1000 \
       211008_BC124_data/sample_01_2

date +'Finished at %R.'
