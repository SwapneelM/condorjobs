echo "Initialize Script"
cd /afs/cern.ch/work/s/smehta/public/tsc-cern && pwd
echo "Set and Source conda paths"
conda init bash
source /afs/cern.ch/user/s/smehta/.bashrc

echo "Activate conda environment"
conda activate deephgcalenv
echo "Export path to Jan's libraries CUDA"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/afs/cern.ch/work/j/jkiesele/public/cuda_lib/cudatoolkit-9.0-h13b8566_0/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/afs/cern.ch/work/j/jkiesele/public/cuda_lib/cudnn-7.1.2-cuda9.0_0/
cd DeepHGCal/python
echo "Check GPU status"
gpustat
setgpu
echo "Starting Training Command"
python standalone-models/tntuples.py configs/Jan19cfg.ini tntuples
