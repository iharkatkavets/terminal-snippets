### App signing management
Get a glance at the identities ("SHA1" "Name") <br>
`$ security find-identity -v -p codesigning` <br>

Get information about the code signing status <br>
`$ codesign -vv -d Payload/Example.app` <br>

Entitlements embedded in binary <br>
`$ codesign -d --entitlements - Payload/Example.app/` <br>

Verify provision profile <br>
`$ openssl smime -in PROFILE.mobileprovision -inform der -verify` <br>

Find a certificate item and print  SHA-1 hash of the certificate <br>
`$ security find-certificate -a -c 'NAME_OF_THE_CERTIFICATE' -Z login.keychain` <br>

Check a PKCS#12 file (.pfx or .p12) <br>
`$ openssl pkcs12 -info -in CERTIFICATE.p12` <br>

Get SHA1 fingerprint from p12 <br>
`$ keytool -list -v  -storetype PKCS12 -storepass 'CERTPASSWORD' -keystore CERT.p12` <br>

Get SHA1 fingerprint from p12 (pretty print) <br>
`$ keytool -list -v  -storetype PKCS12 -storepass 'CERTPASSWORD' -keystore CERT.p12 | grep SHA1 | tr -d :` <br>

Send a push notification to a specified device (requires `houston` gem) <br>
`$ apn push -e production <DEVICE_TOKEN> -c <CERTIFICATE.PEM> -m <MESSAGE>` <br>
`$ apn push <DEVICE_TOKEN> -c <CERTIFICATE.PEM> -m <MESSAGE>` <br>

### Resign the app
Unzip the ipa file <br>
`$ unzip MyApp.ipa` <br>
Extract entitlements to entitlements.xml file <br>
`$ codesign -d --entitlements entitlements.xml Payload/MyApp.app` <br>
Replace empbedded mobileprovision file and resign the app  <br>
`$ codesign --entitlements entitlements.xml -f -s  "iPhone Distribution: COMPANY" Payload/MyApp.app` <br>
Create ipa file (excluding .DS_Store files from zip archive) <br>
`$ zip -r MyApp.ipa Payload -x "*.DS_Store"` <br>
