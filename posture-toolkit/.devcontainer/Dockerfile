# ============================================================
# Posture Toolkit Container
# 
# A container for security posture assessment operations. 
# Includes vulnerability scanning & posture assessment tools.
# ============================================================

FROM debian:bookworm AS base

FROM anchore/grype:v0.115.0 AS grype
FROM anchore/syft:v1.46.0 AS syft
FROM aquasec/trivy:0.72.0 AS trivy
FROM mondoo/cnspec:13.27.4 AS cnspec
FROM trufflesecurity/trufflehog:3.95.8 AS trufflehog

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
    jq \
    yq 

# ============================================
# Install Security Tools
# ============================================
COPY --from=trivy /usr/local/bin/trivy /usr/local/bin/trivy
COPY --from=cnspec /usr/local/bin/cnspec /usr/local/bin/cnspec
COPY --from=syft /syft /usr/local/bin/syft
COPY --from=grype /grype /usr/local/bin/grype
COPY --from=trufflehog /usr/bin/trufflehog /usr/local/bin/trufflehog

# ============================================
# Install Starship for terminal customization
# ============================================
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y

# ============================================
# Finalize Development Environment 
# ============================================
USER $USERNAME
WORKDIR /workspaces