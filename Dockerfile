FROM structurizr/lite

# Install curl, tar, and any other dependencies required to download and extract Structurizr CLI
RUN apt-get update && apt-get install -y \
    curl \
    tar \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory to /workspace, which will be mounted by GitHub Actions or other CI tools
WORKDIR /workspace

# Define the entrypoint to use Structurizr CLI by default
ENTRYPOINT ["structurizr-cli"]

# Optionally, specify default arguments for Structurizr CLI
CMD ["--help"]
