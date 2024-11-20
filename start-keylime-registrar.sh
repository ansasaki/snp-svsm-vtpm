podman run --rm -d \
    -v ~/keylime/CERTS:/var/lib/keylime:z \
    -p 8890:8890 -p 8891:8891 \
    -e KEYLIME_REGISTRAR_IP=0.0.0.0 \
    --name registrar \
    localhost/keylime_registrar
