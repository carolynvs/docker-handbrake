FROM jlesage/handbrake:v1.5.7

# curl is used for a post conversion webhook
RUN add-pkg curl

# Tweak base image with modified scripts
COPY rootfs/ /

# Allow children to easily substitute different defaults
ONBUILD COPY rootfs/ /
