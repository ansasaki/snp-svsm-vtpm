# Run the keylime tenant in a container, passing the provided arguments
#
# The registrar and verifier IP can be set via the --registrar and --verifier
# respectively
#
# If not provided, it is assumed the registrar and the verifier are running in
# the local machine and set the IP using the local IP

TENANT_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --registrar)
      REGISTRAR_IP="$2"
      shift 2
      ;;
    --verifier)
      VERIFIER_IP="$2"
      shift 2
      ;;
    *)
      # Capture the other arguments and pass to the tenant
      TENANT_ARGS+=("$1")
      shift
      ;;
  esac
done

if [[ -z "${REGISTRAR_IP}" ]]; then
    REGISTRAR_IP=$(hostname -I | awk '{print $1}')
fi

if [[ -z "${VERIFIER_IP}" ]]; then
    VERIFIER_IP=$(hostname -I | awk '{print $1}')
fi

# Run the tenant in the container passing the collected arguments
podman run --rm -ti \
    -e KEYLIME_TENANT_REGISTRAR_IP=${REGISTRAR_IP} \
    -e KEYLIME_TENANT_VERIFIER_IP=${VERIFIER_IP} \
    --network host \
    -v ~/keylime/CERTS:/var/lib/keylime:z \
    localhost/keylime_tenant ${TENANT_ARGS[@]}
