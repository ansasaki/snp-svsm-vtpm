mkdir -p ~/keylime/CERTS
podman run --rm -d -v ~/keylime/CERTS:/var/lib/keylime:z -p 8880:8880 -p 8881:8881 --network=host localhost/keylime_verifier
