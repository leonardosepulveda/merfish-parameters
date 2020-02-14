#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p zhuang,shared
#SBATCH -t 7-00:00:00
#SBATCH --mem 4000
#SBATCH --open-mode=append
#SBATCH -o /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/out/BC064/BC064_sample_02.out
#SBATCH -e /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/err/BC064/BC064_sample_02.err

date +'Starting at %R.'

source centos7-modules.sh
module load Anaconda3/5.0.1-fasrc01
source activate merlin_env
module load gcc/8.2.0-fasrc01
module load fftw
which python
echo BC064_sample_02

merlin -k parameters_BC064.json \
       -a merlin_analysis_BC064.json \
       -o data_organization_BC064.csv \
       -p positions_BC064_sample_02.txt \
       -c J4E1_codebook_refseq.csv \
       -m MERFISH3.json \
       -n 1000 \
       190812_BC064_MERFISH/sample_02

date +'Finished at %R.'