# Snippets

* [Xcode Archive IPA signing](./ios-ipa-signing.md)<br>
* [Bash Terminal](./bash-snippets.md)<br>
* [Xcode debuger extension Chisel](./chisel-debug-snippets.md)<br>
* [Xcode shortcuts](./xcode-shortcuts.md)<br>


## CURL
Download and find and count occurances of `regex_pattern` in response (by adding new line `\\\n`)
```bash
$ curl  -v --silent 'http://awesome.com' 2>&1 | sed $'s/regex_pattern/regex_pattern\\\n/g' | grep -c 'regex_pattern'
```

### Git
Clean up submodules
```bash
$ git submodule foreach --recursive git clean -x -f -d
```

### App signing management
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

Get SHA1 fingerprint from p12 (pretty print)
```bash
keytool -list -v  -storetype PKCS12 -storepass 'CERTPASSWORD' -keystore CERT.p12 | grep SHA1 | tr -d :
```
