# ============================================================
# Node.js Dev Container
# 
# A container for a full Node.js development environment. 
# Includes Node.js runtime and common development utilities.
# ============================================================

FROM node:26-bookworm AS base

FROM base AS devcontainer

ARG USERNAME=devcontainer

# ============================================
# Install Starship for terminal customization
# ============================================
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y

# ============================================
# Finalize Development Environment 
# ============================================
USER $USERNAME
WORKDIR /workspaces