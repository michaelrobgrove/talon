Coming Soon.





# Basic CPU-only setup
docker compose up

# With NVIDIA GPU
docker compose -f docker-compose.nvidia.yml up

# With Intel VAAPI
ENABLE_VAAPI=true docker compose up

# With multiple accelerators
ENABLE_VAAPI=true ENABLE_CORAL=true docker compose up
