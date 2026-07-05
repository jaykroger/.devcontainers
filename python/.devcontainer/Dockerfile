# ============================================================
# Python Dev Container
# 
# A container for a full Python development environment. 
# Includes Python runtime and common development utilities.
# ============================================================

FROM python:3.14-bookworm AS base

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