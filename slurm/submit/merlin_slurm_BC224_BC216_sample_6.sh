#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p zhuang,shared
#SBATCH -t 7-00:00:00
#SBATCH --mem 4000
#SBATCH --open-mode=append
#SBATCH -o /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/out/BC224_BC216_sample_6.out
#SBATCH -e /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/err/BC224_BC216_sample_6.err

date +'Starting at %R.'

source centos7-modules.sh
module load Anaconda3/5.0.1-fasrc01
source activate merlin_env
module load gcc/8.2.0-fasrc01
module load fftw
which python
echo BC216_BC216_sample_06_data

merlin -k parameters_BC224.json \
       -a merlin_analysis_mosaics_mlpx_20_bits.json \
       -o data_organization_BC216_MF3.csv \
       -p positions_BC216_sample_06.txt \
       -c C2v6_codebook_mplx.csv \
       -m MERFISH3.json \
       -n 1000 \
       -e /n/holylfs04/LABS/zhuang_lab/Lab/shared/data/ \
       -s /n/holyscratch01/zhuang_lab/Lab/shared/BC216_sample_06_mosaics \
       BC216_sample_06_data

date +'Finished at %R.'