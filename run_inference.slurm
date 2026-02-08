#!/bin/bash
#SBATCH --job-name=flood-diff-inference
#SBATCH --output=inference_%j.out
#SBATCH --error=inference_%j.err
#SBATCH --time=01:00:00
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --mem=32G
#SBATCH --cpus-per-task=4

# Load modules (adjust based on your cluster)
module load python/3.9
module load cuda/11.8

# Activate virtual environment if you have one
# source ~/envs/flood-diff/bin/activate

# Install dependencies (run once, then comment out)
# pip install torch torchvision rasterio tqdm opencv-python pandas tensorboardx pillow --user

# Run inference
cd $SLURM_SUBMIT_DIR
python sr.py -p test -c config/inference-test.json -output_dir ./inference_output

echo "Inference complete. Results in ./inference_output/"
