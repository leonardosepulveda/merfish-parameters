#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p zhuang
#SBATCH -t 7-00:00:00
#SBATCH --mem 4000
#SBATCH --open-mode=append
#SBATCH -o /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/out/BC214_sample_03.out
#SBATCH -e /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/err/BC214_sample_03.err

date +'Starting at %R.'

source centos7-modules.sh
module load Anaconda3/5.0.1-fasrc01
source activate merlin_env
module load gcc/8.2.0-fasrc01
module load fftw
which python
echo BC214_sample_03

merlin -k parameters_BC214.json \
       -a merlin_analysis_BC214_tumor.json \
       -o data_organization_BC214_MF4.csv \
       -p positions_BC214_sample_03.txt \
       -c C2v6_codebook_mplx.csv \
       -m MERFISH4.json \
       -n 1000 \
       -e /n/holyscratch01/zhuang_lab/Lab/shared/BC214/data_MF4 \
       -s /n/holyscratch01/zhuang_lab/Lab/shared/BC214/analysis_MF4 \
       sample_03

date +'Finished at %R.'
