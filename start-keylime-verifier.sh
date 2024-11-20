mkdir -p ~/keylime/CERTS
podman run --rm -di \
    -v ~/keylime/CERTS:/var/lib/keylime:z \
    -p 8880:8880 \
    -p 8881:8881 \
    --name verifier \
    -e KEYLIME_VERIFIER_IP=0.0.0.0 \
    localhost/keylime_verifier
