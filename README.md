# 💻 Terminal Snippets


### Git
Clean up submodules <br>
`$ git submodule foreach --recursive git clean -xfd` <br>
`$ git submodule update -f --init --recursive --remote`

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
Find files matched pattern `*.ipa` and extract to directory named `filename.unz` <br/>
```$ find . -name '*.ipa' -exec sh -c 'unzip -d `basename {}`.unz {}' \; ``` <br/>
Find files with matched patterh `*.txt` and copy to CGL-28825 directory <br/>
```$ find ./UnitTests/ -name '*.txt' -exec sh -c 'cp {} CGL-28825/{}' \; ``` <br/>
Find duplicated files in the directory <br>
```$ find . ! -empty -type f -exec md5 {} + | sort | uniq -d``` <br/>
Find in current folder the folders that were modified 182 days ago and delete them <br/>
```$ find ./ -maxdepth 1 -type d -ctime +182 -exec rm -rfv {} \;``` <br/>
Find in current folder PNG images and remove alpha channel. Adds white color to background. Overwrites!<br/>
```bash
$ find . -name '*.png' -exec sh -c 'convert {} -background white -alpha remove -alpha off {}' \;
```
Find all Info.plist files and add new boolean false value
```bash
$ find ./ -name Info.plist -exec sh -c '/usr/libexec/PlistBuddy -c "Add :test bool false" {}'  \; 
```

### $ sed
Find all \*.txt files in dir and execute sed without backuping <br>
```bash
$ find ./UnitTests/ -type f -name '*.txt' -exec sed -i '' -e 's/video_url_android/dash/g' {} +
```
Extract minor number from version
```bash
$ echo '1.2.3' | sed 's/\([0-9]\).[0-9].[0-9]/\1/'
```
Extract substring `"Bench press"` from a string `"title": "Bench press"` 
```bash
$ echo '"title": "Bench press"' | sed -ne 's/"title": \([a-z]+\)*//p'
```
|   |   |   |
|---|---|---|
|`[[:space:]]*`|match the whitespace characters `<tab>` and `<space>`|   |
|   |   |   |
|   |   |   |

### $ curl
Download and find and count occurances of `regex_pattern` in response (by adding new line `\\\n`)
```bash
$ curl  -v --silent 'http://awesome.com' 2>&1 | sed $'s/regex_pattern/regex_pattern\\\n/g' | grep -c 'regex_pattern'
```
An example with query parameters <br/>
```bash
curl -X POST -H "Accept: application/json" -H "Authorization: Basic xxxxxxxx" -H "Content-Type: application/x-www-form-urlencoded" --data 'grant_type=clone&refresh_token=xxx-xxx&scope=client'  'https://SERVER_URL'
```

### $ grep
Extract substring from string:
```bash
$ grep -o -E '^[H](H|T|t)+-[0-9]{4}'
```
Extract `123` from `versionCode 123`
```bash
$ cat build.gradle | grep 'versionCode ' | grep -o -E '[0-9]+'
```
Extract `"1.2.3"` from `versionName "1.2.3"`
```bash
$ cat build.gradle | grep 'versionName ' | grep -o -E '\"[0-9].[0-9].[0-9]\"'
```

### $ rsync
Sync images(png, PNG, jpg, JPG)  in 2 local folders
```bash
$  rsync -r --include="*.[Jj][Pp][Gg]" --include="*.[Pp][Nn][Gg]" --include="*/" --exclude="*" -av --progress FromDir1/ ToDir2/
```


### Formatting
Pretty print JSON string
```bash
$ echo '{"foo": "lorem", "bar": "ipsum"}' | python -m json.tool
```
Pretty print XML string
```bash
$ echo '<root><foo a="b">lorem</foo><bar value="ipsum" /></root>' | xmllint --format -
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
`M-x magit-section-cycle-diffs` - to expand all diffs

### Midnight Commander
`ESC+o` - open directory in another panel 

### Xcode. Setup template commands
Rename class prefix occurances in the folder.
``` bash
$ find ./ -type f -exec sed -i "" -e 's/CLConfirmLogout/___VARIABLE_productName:identifier___/g' {} \;
```

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

### Android. 
Grep logs from the Android device
`$ ~/Library/Android/sdk/platform-tools/adb logcat | grep BUNDLE_ID`

### FFMPEG
Cut video of [duration]
```bash
$ ffmpeg -ss [start] -i in.mp4 -t [duration] -c copy out.mp4
```
Create gif image from movie
```bash 
$ ffmpeg -i out.mp4 -pix_fmt rgb24 output.gif
```
