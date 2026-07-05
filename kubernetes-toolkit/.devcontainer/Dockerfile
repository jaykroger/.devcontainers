# ======================================================================
# Kubernetes Toolkit Container
# 
# A container that provides a toolkit for working with Kubernetes. 
# Includes kubectl, helm, flux, kustomize, and other common admin tools.
# ======================================================================

FROM debian:bookworm AS base

FROM alpine/helm:3.21 AS helm
FROM aquasec/trivy:0.72.0 AS trivy
FROM fluxcd/flux-cli:v2.9.0 AS flux
FROM rancher/kubectl:v1.35.2 AS kubectl
FROM smallstep/step-cli:0.30.6 AS step-cli

FROM quay.io/cilium/cilium-cli:v0.19.5 AS cilium-cli
FROM ghcr.io/siderolabs/talosctl:v1.13.5 AS talosctl


FROM base AS devcontainer

ARG USERNAME=devcontainer

# ============================================
# Install Required Base Packages
# ============================================
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    dnsutils \
    gnupg \
    iputils-ping \
    yq
    
# ============================================
# Install Kubernetes Tools
# ============================================
COPY --from=talosctl /talosctl /usr/local/bin/talosctl
COPY --from=kubectl /bin/kubectl /usr/local/bin/kubectl 
COPY --from=helm /usr/bin/helm /usr/local/bin/helm
COPY --from=flux /usr/local/bin/flux /usr/local/bin/flux
COPY --from=cilium-cli /usr/local/bin/cilium /usr/local/bin/cilium
COPY --from=trivy /usr/local/bin/trivy /usr/local/bin/trivy
COPY --from=step-cli /usr/local/bin/step /usr/local/bin/step

# ============================================
# Install Starship for terminal customization
# ============================================
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y

# ============================================
# Finalize Development Environment 
# ============================================
USER $USERNAME
WORKDIR /workspaces