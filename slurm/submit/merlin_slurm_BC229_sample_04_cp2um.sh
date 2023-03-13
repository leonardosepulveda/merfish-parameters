#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p zhuang
#SBATCH -t 7-00:00:00
#SBATCH --mem 4000
#SBATCH --open-mode=append
#SBATCH -o /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/out/BC229_sample_04_cp2um.out
#SBATCH -e /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/err/BC229_sample_04_cp2um.err

date +'Starting at %R.'

source centos7-modules.sh
module load Mamba/4.14.0-0
source activate merlin_env_cp2
module load gcc/8.2.0-fasrc01
module load fftw
which python
echo BC229_sample_04_cp2um

merlin -k parameters_BC229.json \
       -a merlin_analysis_BC229_sample_04_cp2um.json \
       -o data_organization_BC_MF3.csv \
       -p positions_BC229_sample_04.txt \
       -c C2v6_codebook_mplx.csv \
       -m MERFISH3.json \
       -n 1000 \
       -e /n/holylfs05/LABS/zhuang_lab/Lab/shared/data \
       -s /n/holyscratch01/zhuang_lab/Lab/shared/BC229_sample_04_merlin_cp2um  \
       BC229_sample_04_data

date +'Finished at %R.'
