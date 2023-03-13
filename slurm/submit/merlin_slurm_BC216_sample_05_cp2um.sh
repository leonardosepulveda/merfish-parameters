#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p zhuang
#SBATCH -t 7-00:00:00
#SBATCH --mem 4000
#SBATCH --open-mode=append
#SBATCH -o /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/out/BC216_sample_05_cp2um.out
#SBATCH -e /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/err/BC216_sample_05_cp2um.err

date +'Starting at %R.'

source centos7-modules.sh
module load Mamba/4.14.0-0
source activate merlin_env_cp2
module load gcc/8.2.0-fasrc01
module load fftw
which python
echo BC216_sample_05_cp2um

merlin -k parameters_BC216.json \
       -a merlin_analysis_BC216_sample_05_cp2um.json \
       -o data_organization_BC216_MF5.csv \
       -p positions_BC216_sample_05.txt \
       -c C2v6_codebook_mplx.csv \
       -m MERFISH5.json \
       -n 1000 \
       -e /n/holylfs05/LABS/zhuang_lab/Lab/shared/data \
       -s /n/holyscratch01/zhuang_lab/Lab/shared/BC216_sample_05_merlin_cp2um \
       BC216_sample_05_data

date +'Finished at %R.'
