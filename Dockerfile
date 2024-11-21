# Use devcontainer Universal image as the base image since Structurizr CLI is a Java application and java is included
FROM mcr.microsoft.com/devcontainers/universal:linux

# Set environment variables
ENV STRUCTURIZR_VERSION=1.14.0

# Install curl, tar, and any other dependencies required to download and extract Structurizr CLI
RUN apt-get update && apt-get install -y \
    curl \
    tar \
    && rm -rf /var/lib/apt/lists/*

# Download and install Structurizr CLI
RUN curl -sSL https://github.com/structurizr/cli/releases/download/v${STRUCTURIZR_VERSION}/structurizr-cli-${STRUCTURIZR_VERSION}-linux-x86_64.tar.gz | tar -xz \
    && mv structurizr-cli /usr/local/bin/structurizr-cli

# Set the working directory to /workspace, which will be mounted by GitHub Actions or other CI tools
WORKDIR /workspace

# Define the entrypoint to use Structurizr CLI by default
ENTRYPOINT ["structurizr-cli"]

# Optionally, specify default arguments for Structurizr CLI
CMD ["--help"]
