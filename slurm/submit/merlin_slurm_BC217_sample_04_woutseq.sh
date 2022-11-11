#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p zhuang,shared
#SBATCH -t 7-00:00:00
#SBATCH --mem 4000
#SBATCH --open-mode=append
#SBATCH -o /n/home13/sboersma/Software/merfish-parameters/slurm/out/BC217_sample_04.out
#SBATCH -e /n/home13/sboersma/Software/merfish-parameters/slurm/err/BC217_sample_04.err

date +'Starting at %R.'

source centos7-modules.sh
module load Anaconda3/5.0.1-fasrc01
source activate merlin_vLSD.06.20
module load gcc/8.2.0-fasrc01
module load fftw
which python
echo BC214_sample_04

merlin -k parameters_BC214_02.json \
       -a merlin_analysis_BC217_02_woutseq.json \
       -o data_organization_BC217_02_woutseq.csv \
       -p positions_BC217_sample_04.txt \
       -c C2v6_codebook_mplx.csv \
       -m MERFISH5.json \
       -n 1000 \
       -e /n/holyscratch01/zhuang_lab/Lab/shared \
       -s /n/holyscratch01/zhuang_lab/Lab/shared/BC217_sample_04_new_cellpose_params_merlin \
       BC217_sample_04_data

date +'Finished at %R.'
