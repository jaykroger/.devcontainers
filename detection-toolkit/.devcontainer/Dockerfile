# ====================================================================
# Detection Engineering Toolkit Container
# 
# A container for detection engineering workflows. 
# Includes Sigma, Atomic Red Team, an EDR agent, and additional tools.
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
# Download Atomic Red Team Repository
# ============================================
ENV HOMe=/home/$USERNAME
RUN git clone https://github.com/redcanaryco/atomic-red-team $HOME/AtomicRedTeam

# ============================================
# Install Starship for terminal customization
# ============================================
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y

# ============================================
# Finalize Development Environment 
# ============================================
USER $USERNAME
WORKDIR /workspaces