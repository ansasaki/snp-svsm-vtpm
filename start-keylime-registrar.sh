podman run --rm -d -v ~/keylime/CERTS:/var/lib/keylime:z -p 8890:8890 -p 8891:8891 --network=host  localhost/keylime_registrar
