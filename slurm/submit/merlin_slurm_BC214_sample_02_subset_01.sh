#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p zhuang
#SBATCH -t 7-00:00:00
#SBATCH --mem 4000
#SBATCH --open-mode=append
#SBATCH -o /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/out/BC214_sample_02_subset_01.out
#SBATCH -e /n/home06/lsepulvedaduran/Software/merfish-parameters/slurm/err/BC214_sample_02_subset_01.err

set -e

date +'Starting at %R.'

source centos7-modules.sh
module load Anaconda3/5.0.1-fasrc01
source activate merlin_env
module load gcc/8.2.0-fasrc01
module load fftw
which python
echo BC214_sample_02_subset_01

merlin -k parameters_BC214.json \
       -a merlin_analysis_BC214_subsets.json \
       -o data_organization_BC214.csv \
       -p positions_BC214_sample_02_subset_01.txt \
       -c C2v6_codebook_mplx.csv \
       -m MERFISH3.json \
       -n 1000 \
       -e /n/holyscratch01/zhuang_lab/Lab/shared  \
       -s /n/holyscratch01/zhuang_lab/Lab/shared/BC214_sample_02_subset_01_merlin \
       BC214_sample_02_subset_01_data

data_folder   = 'BC214_sample_02_subset_01_data'
output_folder = 'BC214_sample_02_subset_01_merlin'
data_home     = '/n/holyscratch01/zhuang_lab/Lab/shared'
output_home   = '/n/holyscratch01/zhuang_lab/Lab/shared'
tape_home     = '/n/holylfs04/LABS/zhuang_lab/Lab/shared/tape' 

date + 'converting output to .tar.gz at %R'
time tar -cf - "$output_home/$output_folder/ | zstd -1 -T6 - >  \
                $tape_home/$output_folder.tar.zst"

date + 'converting data to .tar.gz at %R'
time tar -cf - "$data_home/$data_folder/ | zstd -1 -T6 - >  \
                $tape_home/$data_folder.tar.zst"

date +'Finished at %R.'
