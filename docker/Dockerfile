# Use NVIDIA CUDA base image
FROM nvidia/cuda:11.8.0-devel-ubuntu22.04 AS builder

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update -y && \
    apt-get install -y curl python3 python3-pip git libgl1-mesa-glx libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/*

# Clone LigandMPNN repository
RUN git clone https://github.com/dauparas/LigandMPNN.git /app/LigandMPNN

# Set working directory to LigandMPNN
WORKDIR /app/LigandMPNN

# Get model parameters
RUN bash get_model_params.sh "./model_params"

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy application files
COPY main.py /app/LigandMPNN/main.py
COPY start.sh /app/LigandMPNN/start.sh

# Make start.sh executable
RUN chmod +x /app/LigandMPNN/start.sh

# Set the entrypoint
ENTRYPOINT ["/app/LigandMPNN/start.sh"]