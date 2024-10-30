sudo dnf install cargo openssl-devel clang tpm2-tss-devel
git clone https://github.com/keylime/rust-keylime.git
cd rust-keylime
cargo build
mkdir -p /var/lib/keylime
export KEYLIME_AGENT_RUN_AS=""
RUST_LOG=debug TCTI=device:/dev/tpm1 KEYLIME_AGENT_REGISTRAR_IP=10.6.68.36 target/debug/keylime_agent
