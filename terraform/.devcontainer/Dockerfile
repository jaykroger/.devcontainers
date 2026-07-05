# ============================================================
# Terraform Dev Container
# 
# A container for a full Terraform development environment. 
# Includes Terraform CLI and common development utilities.
# ============================================================

FROM debian:bookworm AS base

FROM hashicorp/terraform:1.15 AS terraform


FROM base AS devcontainer

ARG USERNAME=devcontainer

# ============================================
# Install Required Base Packages
# ============================================
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    gnupg \
    jq \
    yq

# ============================================
# Install Terraform
# ============================================
COPY --from=terraform /bin/terraform /usr/local/bin/terraform

# ============================================
# Install Starship for terminal customization
# ============================================
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y

# ============================================
# Finalize Development Environment 
# ============================================
USER $USERNAME
WORKDIR /workspaces