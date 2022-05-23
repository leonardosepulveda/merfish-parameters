#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p zhuang,shared
#SBATCH -t 7-00:00:00
#SBATCH --mem 4000
#SBATCH --open-mode=append
#SBATCH -o /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/out/test.out
#SBATCH -e /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/err/test.err

date +'Starting at %R.'

source centos7-modules.sh
module load Anaconda3/5.0.1-fasrc01
source activate merlin_env
module load gcc/8.2.0-fasrc01
module load fftw
which python
echo test

merlin -k parameters_test.json \
       -a merlin_analysis_test.json \
       -o data_organization_20210524_4t1nsgMarta2_C2Conctest_2uguL.csv \
       -p positions_20210524_4t1nsgMarta2_C2Conctest_2uguL.txt \
       -c C2v6_codebook_mplx.csv \
       -m zeiss.json \
       -n 1000 \
       -e /n/holyscratch01/zhuang_lab/Users/lsepulvedaduran/data \
       -s /n/holyscratch01/zhuang_lab/Users/lsepulvedaduran/analysis \
       20210524_4t1nsgMarta2_C2Conctest_2uguL

date +'Finished at %R.'
