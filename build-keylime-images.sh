sudo dnf install skopeo tpm2-tss-devel opessl-devel clang cargo rust

cd keylime/docker/release
bash build_locally.sh
