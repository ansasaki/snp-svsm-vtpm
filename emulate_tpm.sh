sudo dnf install swtpm swtpm-tools
mkdir TPM_STATE
swtpm_setup --tpm-state TPM_STATE --createek --decryption --create-ek-cert --create-platform-cert --lock-nvram --overwrite --display --tpm2 --pcr-banks sha256
modprobe tpm_vtpm_proxy
swtpm chardev --vtpm-proxy --tpmstate dir=TPM_STATE --tpm2 &
tpm2_getekcertificate -Tdevice:/dev/tpm1 > /tmp/pub.crt
openssl x509 -in /tmp/pub.crt -text
