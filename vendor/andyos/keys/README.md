# AndyOS Signing Keys
# DO NOT COMMIT ACTUAL KEYS TO VERSION CONTROL

# Key generation instructions:
# 1. Generate platform key:
#    subject='/C=US/ST=California/L=Privacy/O=AndyOS/OU=Security/CN=AndyOS Platform/emailAddress=security@andyos.org'
#    openssl genrsa -out platform.key 4096
#    openssl req -new -x509 -key platform.key -out platform.crt -days 10000 -subj "$subject"
#
# 2. Generate media key:
#    openssl genrsa -out media.key 4096
#    openssl req -new -x509 -key media.key -out media.crt -days 10000 -subj "$subject"
#
# 3. Generate shared key:
#    openssl genrsa -out shared.key 4096
#    openssl req -new -x509 -key shared.key -out shared.crt -days 10000 -subj "$subject"
#
# 4. Generate releasekey:
#    openssl genrsa -out releasekey.key 4096
#    openssl req -new -x509 -key releasekey.key -out releasekey.crt -days 10000 -subj "$subject"

# AVB (Android Verified Boot) key generation:
# openssl genrsa -out avb.key 4096
# avbtool extract_public_key --key avb.key --output avb_pkmd.bin

# OTA signing key:
# openssl genrsa -out ota.key 4096
# openssl req -new -x509 -key ota.key -out ota.crt -days 10000 -subj "$subject"

# Store keys securely and add to .gitignore
