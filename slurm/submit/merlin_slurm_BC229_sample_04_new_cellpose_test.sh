#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p zhuang
#SBATCH -t 7-00:00:00
#SBATCH --mem 4000
#SBATCH --open-mode=append
#SBATCH -o /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/out/BC229_sample_04_new_cellpose_test.out
#SBATCH -e /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/err/BC229_sample_04_new_cellpose_test.err

date +'Starting at %R.'

source centos7-modules.sh
module load Anaconda3/5.0.1-fasrc01
source activate merlin_env_xingjie
module load gcc/8.2.0-fasrc01
module load fftw
which python
echo BC229_sample_04_new_cellpose_test

merlin -k parameters_BC229.json \
       -a merlin_analysis_BC229_sample_04_new_cellpose.json \
       -o data_organization_BC_MF3.csv \
       -p positions_BC229_sample_04.txt \
       -c C2v6_codebook_mplx.csv \
       -m MERFISH3.json \
       -n 1000 \
       -e /n/holyscratch01/zhuang_lab/Lab/shared \
       -s /n/holyscratch01/zhuang_lab/Lab/shared/BC229_sample_04_merlin_new_cellpose_test  \
       BC229_sample_04_data

date +'Finished at %R.'
