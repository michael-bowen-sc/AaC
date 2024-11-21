# Use devcontainer Universal image as the base image since Structurizr CLI is a Java application and java is included
FROM mcr.microsoft.com/devcontainers/universal:linux

# Install curl, tar, and any other dependencies required to download and extract Structurizr CLI
RUN apt-get update && apt-get install -y \
    curl \
    tar \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Download and install Structurizr CLI
RUN curl -L https://github.com/structurizr/cli/releases/download/v2024.11.04/structurizr-cli.zip -o structurizr-cli.zip && \
    unzip structurizr-cli.zip && \
    mv structurizr-cli /usr/local/bin/structurizr-cli

# Set the working directory to /workspace, which will be mounted by GitHub Actions or other CI tools
WORKDIR /workspace

# Define the entrypoint to use Structurizr CLI by default
ENTRYPOINT ["structurizr-cli"]

# Optionally, specify default arguments for Structurizr CLI
CMD ["--help"]
