#!/bin/bash

#SBATCH --job-name=Check
#SBATCH --array=1-16
##SBATCH --ntasks=5
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100M
#SBATCH --time=0:05:00


# You may not place any commands before the last SBATCH directive

# Define and create a unique scratch directory for this job
# SCRATCH_DIRECTORY=/global/work/${USER}/${SLURM_JOBID}.stallo-adm.uit.no
# mkdir -p ${SCRATCH_DIRECTORY}
# cd ${SCRATCH_DIRECTORY}

# You can copy everything you need to the scratch directory
# ${SLURM_SUBMIT_DIR} points to the path where this script was submitted from
# cp ${SLURM_SUBMIT_DIR}/myfiles*.txt ${SCRATCH_DIRECTORY}

# This is where the actual work is done. In this case, the script only waits.
# The time command is optional, but it may give you a hint on how long the
# command worked
time sleep 200
echo "HELLO" ${SLURM_JOBID} > /ceph/zoo/users/ngrosso/world_${SLURM_JOBID}_${SLURM_ARRAY_TASK_ID}.txt
#sleep 10

# After the job is done we copy our output back to $SLURM_SUBMIT_DIR
#cp ${SCRATCH_DIRECTORY}/my_output ${SLURM_SUBMIT_DIR}

# In addition to the copied files, you will also find a file called
# slurm-1234.out in the submit directory. This file will contain all output that
# was produced during runtime, i.e. stdout and stderr.

# After everything is saved to the home directory, delete the work directory to
# save space on /global/work
#cd ${SLURM_SUBMIT_DIR}
#rm -rf ${SCRATCH_DIRECTORY}

# Finish the script
exit 0