#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p zhuang,shared
#SBATCH -t 7-00:00:00
#SBATCH --mem 4000
#SBATCH --open-mode=append
#SBATCH -o /n/home13/sboersma/Software/merfish-parameters/slurm/out/BC216_sample_06_reregister.out
#SBATCH -e /n/home13/sboersma/Software/merfish-parameters/slurm/err/BC216_sample_06_reregister.err

date +'Starting at %R.'

source centos7-modules.sh
module load Anaconda3/5.0.1-fasrc01
source activate merlin_vLSD.06.20
module load gcc/8.2.0-fasrc01
module load fftw
which python
echo BC216_sample_06

merlin -k parameters_BC216_01.json \
       -a merlin_analysis_BC216_01_reregister.json \
       -o data_organization_BC216_01.csv \
       -p positions_BC216_sample_06.txt \
       -c C2v6_codebook_mplx.csv \
       -m MERFISH3.json \
       -n 1000 \
       -e /n/holyscratch01/zhuang_lab/Lab/shared/BC216/BC216_data \
       -s /n/holyscratch01/zhuang_lab/Lab/shared/BC216/BC216_analysis  \
       BC216_sample06


date +'Finished at %R.'
