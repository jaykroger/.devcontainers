# ====================================================================
# Forensics Toolkit Container
# 
# A container for forensic analysis orkflows. 
# Includes binwalk, regripper, sleuthkit, yara, and additional tools.
# ====================================================================

FROM debian:bookworm AS base

FROM base AS devcontainer

ARG USERNAME=devcontainer

# ============================================
# Install Required Base Packages
# ============================================
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    dnsutils \
    git \
    gnupg \
    iputils-ping \
    jq \
    yq 

# ============================================
# Install Toolkit
# ============================================
RUN apt install -y --no-install-recommends \
      binwalk \
      dc3dd \
      regripper \
      sleuthkit \
      yara

# ============================================
# Install Starship for terminal customization
# ============================================
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y

# ============================================
# Finalize Development Environment 
# ============================================
USER $USERNAME
WORKDIR /workspaces