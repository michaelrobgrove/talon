FROM python:3.9-slim

# Basic system dependencies for video processing
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Optional dependencies can be installed at runtime
COPY scripts/install-addons.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/install-addons.sh

WORKDIR /app

# Copy and install base requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app/ app/
COPY run.sh .
RUN chmod +x run.sh

EXPOSE 4200

CMD ["./run.sh"]
