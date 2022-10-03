#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p zhuang
#SBATCH -t 7-00:00:00
#SBATCH --mem 4000
#SBATCH --open-mode=append
#SBATCH -o /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/out/BC185_sample_F2.out
#SBATCH -e /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/err/BC185_sample_F2.err

date +'Starting at %R.'

source centos7-modules.sh
module load Anaconda3/5.0.1-fasrc01
source activate merlin_env
module load gcc/8.2.0-fasrc01
module load fftw
which python
echo BC185_sample_F2

merlin -k parameters_BC185.json \
       -a merlin_analysis_BC185.json \
       -o data_organization_BC185.csv \
       -p positions_BC185_sample_F2.txt \
       -c C2v6_codebook_mplx.csv \
       -m MERFISH3.json \
       -n 1000 \
       -e /n/holyscratch01/zhuang_lab/Users/lsepulvedaduran/data \
       -s /n/holyscratch01/zhuang_lab/Users/lsepulvedaduran/analysis \
       BC185_data/sample_F2

date +'Finished at %R.'
