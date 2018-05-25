# Snippets


### Git
Clean up submodules
```bash
$ git submodule foreach --recursive git clean -x -f -d
```

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
`keytool -list -v  -storetype PKCS12 -storepass 'CERTPASSWORD' -keystore CERT.p12` <br>

Get SHA1 fingerprint from p12 (pretty print) <br>
'keytool -list -v  -storetype PKCS12 -storepass 'CERTPASSWORD' -keystore CERT.p12 | grep SHA1 | tr -d :` <br>

Send a push notification to a specified device (requires `houston` gem) <br>
`$ apn push -e production <DEVICE_TOKEN> -c <CERTIFICATE.PEM> -m <MESSAGE>` <br>
`$ apn push <DEVICE_TOKEN> -c <CERTIFICATE.PEM> -m <MESSAGE>` <br>

## Bash
### Files editing 
Display file changes in real time <br/>
```$ tail -f FILE``` <br/>
Remove new line and escape " symbols in the file <br/>
```$ cat ORIGINFILE.TXT | tr -d '\n' | sed 's/"/\\"/g' > NEWFILE.TXT``` <br/>
Find a string recursively at path <br/>
```$ grep -ir SEARCHABLE_STRING PATH``` <br/>
```$ grep -A NUMBER_OF_LINES_AFTER -ir SEARCHABLE_STRING PATH```<br/>
Create a file from hex string <br/>
```$ writehex 8ade18f6 00000001 00000000 51aabd81 > FILENAME.EXT``` <br/>
Сount characters in string <br/>
```$ echo 'abc...1235abc..' | wc -c``` <br/>

### $ zip
`$ zip -er ZIP.zip file1 dir1 file2` - Zip files with password protecting <br/>

zip files in directory with the same name as parent dir
```bash
$ zip -erv "$(basename `pwd`).zip" production.*
$ Enter password:
$ Verify password:
$ rsync -v "$(basename `pwd`).zip" USER_NAME@SERVER:PATH && rm -rvf "$(basename `pwd`).zip"
$ Password:
```
### $ find
Find files matched pattern `*.ipa` and extract to directory named `filename.unz` <br>
```$ find . -name '*.ipa' -exec sh -c 'unzip -d `basename {}`.unz {}' \; ``` <br>
Find files with matched patterh `*.txt` and copy to CGL-28825 directory <br>
```$ find ./UnitTests/ -name '*.txt' -exec sh -c 'cp {} CGL-28825/{}' \; ```

### $ sed
Find all \*.txt files in dir and execute sed without backuping <br>
```$ find ./UnitTests/ -type f -name '*.txt' -exec sed -i '' -e 's/video_url_android/dash/g' {} +```

### $ curl
Download and find and count occurances of `regex_pattern` in response (by adding new line `\\\n`)
```bash
$ curl  -v --silent 'http://awesome.com' 2>&1 | sed $'s/regex_pattern/regex_pattern\\\n/g' | grep -c 'regex_pattern'
```
An example with query parameters <br/>
```bash
curl -X POST -H "Accept: application/json" -H "Authorization: Basic xxxxxxxx" -H "Content-Type: application/x-www-form-urlencoded" --data 'grant_type=clone&refresh_token=xxx-xxx&scope=client'  'https://SERVER_URL'
```

### Emacs
`select region then M-| pbcopy RET` - copy from Emacs to OS X clipboard<br/>
`M-x hexl-find-file` - editing binary files (`delete-window`)<br/>
`M-x hexl-mode` - translate an existing buffer into hex<br/>

### Git-Emacs
`m` - mark the file the cursor is on ATM<br/>
`M` - mark all files in buffer<br/>
`u/DEL` - unmark file below/above<br/>
`R` - resolve conflicts during merge<br/>
`a` - add file to repository<br/>
`r` - remove file<br/>
`i` - add file to ignore list<br/>
`c` - commit<br/>
`U` - Undo -> revert file<br/>
`l` - see log file<br/>
`g` - refresh the status buffer<br/>
`q` - quit status buffer<br/>
`?` - get help!<br/>

### Emacs-Magit
`M-x magit-process-buffer` - to show the output of recently run git commands

### Midnight Commander
`ESC+o` - open directory in another panel 

## Xcode debugger
### Update view on debug
```objective-c
// stash a view (0x7f84c74ca870 address)
(lldb) e UIView *$cell = (UIView *)[0x7f84c74ca870 superview]
// set a new frame
(lldb) e (void)[$cell setFrame:(CGRect){0.f, 324.f, 10.f, 54.f}]
// set a new frame
(lldb) e (void)[$cell setFrame:(CGRect){0.f, 324.f, 10.f, 54.f}]
// update
(lldb) caflush frame
```

### Examining Variables
Show the contents of the local variable bar formatted as hex.
```
(lldb) frame variable --format x bar
(lldb) fr v -f x bar
```
