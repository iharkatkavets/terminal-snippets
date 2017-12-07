Get a glance at the identities ("SHA1" "Name")
```bash
$ security find-identity -v -p codesigning
```
Get information about the code signing status
```bash
$ codesign -vv -d Payload/Example.app
```

Entitlements embedded in binary
```bash
$ codesign -d --entitlements - Payload/Example.app/
```

Verify provision profile
```bash
$ openssl smime -in PROFILE.mobileprovision -inform der -verify
```

Find a certificate item and print  SHA-1 hash of the certificate
```bash
$ security find-certificate -a -c 'NAME_OF_THE_CERTIFICATE' -Z login.keychain
```

Check a PKCS#12 file (.pfx or .p12)
```bash
$ openssl pkcs12 -info -in CERTIFICATE.p12
```

Get SHA1 fingerprint from p12
```bash
keytool -list -v  -storetype PKCS12 -storepass 'CERTPASSWORD' -keystore CERT.p12
```
