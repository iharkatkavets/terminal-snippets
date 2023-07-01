# 💻 Terminal Snippets


Variables

Strip the directory path from a shell variable string and leave the last part of the path (the filename)
```
$ FILE=${PATHTOFILE##*/}
```
Strip the file name from a shell variable string and leave the dir part of the path
```
$ DIR=${PATHTOFILE%/*}
```

### Ediff shortcuts
<details>
  <summary>Ediff shortcuts expand</summary>

  `a` - apply changes from buffer A<br>
  `b` - apply changes from buffer B<br>
  `d` - keep both variants (A+B)<br>
  `n` - show next changes<br>
  `p` - show previous changes<br>
  `r` - recover the original difference region in buffer C<br>
  `C-x o` - change focused buffer window<br>
  `v` - scroll bottom<br>
  `M-v` - scroll up<br>
  `q` - end ediffing<br>
</details>

---

<details>
  <summary>$ base64</summary>
  
    $ base64 -i IN_FILE_PATH -o OUT_FILE_PATH
   Examples<br>
     
    $ base64 -i CertificateSigningRequest.certSigningRequest -o encodedbase64.txt

   Encode string<br>
     
     $ base64 -D <<< STRING
   
    `base64 <<< LS0tLS1CRUdJTiBDRVJUSUZJ`
    
    `$ base64 -D <<< STRING`
    Decode string<br>
   `base64 -D <<< LS0tLS1CRUdJTiBDRVJUSUZJ== > file.bin`
</details>

---
  
<details>
  <summary>$ convert</summary>
  
   Resize the image <br/>
    ```$ convert image.png -resize 33% resized.png ``` <br/>
</details>
      
---
  
<details>
  <summary>$ echo</summary>

   List all files matching pattern in current directory<br>
     
     $ echo *.txt
     $ echo .*
</details>

---

<details>
<summary>$ git</summary>
    
  Clean up submodules
  ```bash 
  $ git submodule foreach --recursive git clean -xfd
  $ git submodule update -f --init --recursive --remote
  ```
  Cherry pick diffs which are contained only in the `ANY_BRANCH`
  ```bash
  $ git cherry -v master ANY_BRANCH > only-feature-chages.txt
  $ git cherry-pick 64f0e89e718aa034704c5895f9de858afae9da97 f415a7d8c1599021761bab852109ef6389918...
  $ git status
  $ git cherry-pick --continue
  ```
  Git find "string" in the history of diffs
  ```bash
  $ git log -p -S string_for_searching
  ```
  Git print diff between mybranch and master in the file 'myfile.cs'
  ```
  $ git diff mybranch..master -- myfile.cs
  ```
  Find the file in the history
  ```
  $ git log --all --name-status  -- "**/filename.*"
  ```
  Show the file changes in the commit 
  ```
  $ git show <SHA> -- <path-to-file>
  ```
  Restore the file in the working copy
  ```
  $ git checkout <SHA>^ -- <path-to-file>
  ```
  Apply reverted changes from a commit
  ```bash
  $ git show <SHA> -- <path-to-file> | git apply -3 --whitespace=fix -R
  ```
  Add custom ssh identity file to the repository
  ```bash
  $ git config core.sshCommand "ssh -i ~/.ssh/not_default_id_rsa -F /dev/null"
  ```
  Log all particular file commits
  ```bash
  $ git log --follow -- FILE_PATH
  ```
  Revert 3 last commits in with one commit
  ```
  $ git revert --no-commit HEAD~3..
  ```
</details>
  

---


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
  
  
  <details>
  <summary>$ swiftc</summary>
  
   Compilte swift file with generating dSym file <br/>
    ```$ swiftc -g file.swift``` <br/>
   Run executable using lldb debugger<br/>
    ```$ lldb file``` <br/>
   Load dSym file <br/>
    ```(lldb) add-dsym <PathTo.dSYM>``` <br/>
   Print backtrace <br/>
    ```(lldb) thread backtrace``` <br/>
</details>
      
---

<details>
  <summary>$ find</summary>
  
   Find files matched pattern `*.ipa` and extract to directory named `filename.unz` <br/>
    ```$ find . -name '*.ipa' -exec sh -c 'unzip -d `basename {}`.unz {}' \; ``` <br/>
   Find files with matched patterh `*.txt` and copy to CGL-28825 directory <br/>
    `$ find ./UnitTests/ -name '*.txt' -exec sh -c 'cp {} CGL-28825/{}' \; ` <br/>
   Find duplicated files in the directory <br>
    `$ find . ! -empty -type f -exec md5 {} + | sort | uniq -d` <br/>
   Find in current folder the folders that were modified 182 days ago and delete them <br/>
    `$ find ./ -maxdepth 1 -type d -ctime +182 -exec rm -rfv {} \;` <br/>
   Find in current folder PNG images and remove alpha channel. Adds white color to background. Overwrites!<br/>
    `$ find . -name '*.png' -exec sh -c 'convert {} -background white -alpha remove -alpha off {}' \;` <br/>
   Find all Info.plist files and add new boolean false value <br/>
    `$ find ./ -name Info.plist -exec sh -c '/usr/libexec/PlistBuddy -c "Add :test bool false" {}'  \;` <br/>
    `$ find ./ -name Info.plist -exec sh -c '/usr/libexec/PlistBuddy -c "Add :my_key string \"\"" {}' \;` <br/>
   Find example <br/>
    `$ find ./ -type f -name '*.xib' -exec sed -i '' -e 's/<device[a-z=\"0-9_ ]*\/>/<device id=\"appleTV\" appearance=\"light\"\/>/g' {} +` <br/>
    Resize *\*.png* images to size 800x600 and append to new file suffix 800x600.png<br/>
    `$ find ./ -name '*.png' -exec sh -c 'convert {} -resize 800x600! {}%.*_800x600.png' \;`
    Find in `Info.plist` file and print 1 line *A*fter<br/>
    `$ find ./ios/ -name 'Info.plist' -exec sh -c 'grep -A 1 -ir receiver_id {}' \;`<br/>
    Find unique files in directory and copy in another<br/>
    ```$ find ./ -type f -exec md5sum {} + | sort | awk '!c[substr($0, 1, 32)]++' | awk '{print $2}' | xargs -I _ cp _ another_dir
    ```
</details>
      
---

<details>
  <summary>$ ls</summary>
  
   list files in one line <br/>
    ```$ ls | tr "\n" " "
    ```<br/>
</details>

---

<details>
  <summary>$ jq</summary>
  
   Remove new lines from json <br/>
    ```$ jq -c .
    ```<br/>
   Pretty print JSON <br/>
    ```$ jq '.'
    ```
</details>

---

<details>
  <summary>$ sed</summary>
  
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
  
  Extract version from `podspec` file
  ```bash
  $ sed -rn "s/.*([0-9]+\.[0-9]+\.[0-9]+).*/\1/p" [FILE].podspec
  ```
  Replace string from the stdin input
  ```bash
  $ sed 's/\&amp;/\&/g'
  ```
  Replace digits A0 to "A0",
  ```bash
  $ pbpaste| sed 's/\([0-9A-F][0-9A-F]\) /"\1",/g' 
  ```
</details>

---

<details>
  <summary>$ top</summary>
  
   Run `top` in non-interactive(batch) mode <br/>
    ```$ top -l 1``` <br/>
</details>

---

<details>
  <summary>$ clang</summary>
  
   Compile single `main.m` file to executable `prog` <br/>
    ```$ clang -fobjc-arc main.m -o prog1``` <br/>
</details>

---

<details>
  <summary>$ printf</summary>
  
   Tool for formatted output <br/>
    ```$ printf '%-10.10s = %4.2f\n' 'Gigahertz' 1.92735``` <br/>
</details>

---

<details>
  <summary>$ curl</summary>
  
   Download and find and count occurances of `regex_pattern` in response (by adding new line `\\\n`)
   ```bash
   $ curl  -v --silent 'http://awesome.com' 2>&1 | sed $'s/regex_pattern/regex_pattern\\\n/g' | grep -c 'regex_pattern'
   ```
   An example with query parameters <br/>
   ```bash
   curl -X POST -H "Accept: application/json" -H "Authorization: Basic xxxxxxxx" -H "Content-Type: application/x-www-form-urlencoded" --data          'grant_type=clone&refresh_token=xxx-xxx&scope=client'  'https://SERVER_URL'
   ```
</details>

---

<details>
  <summary>$ grep</summary>
  
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
   Extract URL from `file`
   ```bash
   $ grep -o -E 'https://url.com/[?=;&_a-z0-9-]+' ../photos.txt
   ```
   Exclude directories during search
   ```bash
   $ grep --exclude-dir=Pods --exclude-dir=fastlane -ir 'https://' ./
   ```
   Find multiple patterns
   ```
   $ grep -e 'pattern1' -e 'pattern2' file
   ```
</details>

---


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
```bash
echo $(python3 -c "import sys,json; print(json.load(sys.stdin)['fields']['summary'])" <<< ${RESPONSE})
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

<details>
  <summary>Emacs-Magit</summary>

  `M-x magit-process-buffer` - to show the output of recently run git commands<br>
  `M-x magit-section-cycle-diffs` - to expand all diffs<br>
  `l-l b-b` - checkout selected commit in history<br>
</details>

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

### FFMPEG
Cut video of [duration]
```bash
$ ffmpeg -ss [start] -i in.mp4 -t [duration] -c copy out.mp4
```

Create gif image from movie
```
$ ffmpeg -ss 30 -t 3 -i input.mp4 -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 output.gif
```
* This example will skip the first 30 seconds (-ss 30) of the input and create a 3 second output (-t 3).
* fps filter sets the frame rate. A rate of 10 frames per second is used in the example.
* scale filter will resize the output to 320 pixels wide and automatically determine the height while preserving the aspect ratio. The lanczos scaling algorithm is used in this example.
* palettegen and paletteuse filters will generate and use a custom palette generated from your input. These filters have many options, so refer to the links for a list of all available options and values. Also see the Advanced options section below.
* split filter will allow everything to be done in one command and avoids having to create a temporary PNG file of the palette.
* Control looping with -loop output option but the values are confusing. A value of 0 is infinite looping, -1 is no looping, and 1 will loop once meaning it will play twice. So a value of 10 will cause the GIF to play 11 times.
More info http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html
