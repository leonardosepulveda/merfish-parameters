#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p zhuang,shared
#SBATCH -t 7-00:00:00
#SBATCH --mem 4000
#SBATCH --open-mode=append
#SBATCH -o /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/out/BC224_BC217_sample_2.out
#SBATCH -e /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/err/BC224_BC217_sample_2.err

date +'Starting at %R.'

source centos7-modules.sh
module load Anaconda3/5.0.1-fasrc01
source activate merlin_env
module load gcc/8.2.0-fasrc01
module load fftw
which python
echo BC217_BC217_sample_02_data

merlin -k parameters_BC224.json \
       -a merlin_analysis_mosaics_mlpx_20_bits.json \
       -o data_organization_BC217_02_woutseq.csv \
       -p positions_BC217_sample_02.txt \
       -c C2v6_codebook_mplx.csv \
       -m MERFISH5.json \
       -n 1000 \
       -e /n/holylfs04/LABS/zhuang_lab/Lab/shared/data/ \
       -s /n/holyscratch01/zhuang_lab/Lab/shared/BC217_sample_02_mosaics \
       BC217_sample_02_data

date +'Finished at %R.'