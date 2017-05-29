Bash snippets


#### Files editing 
Display file changes in real time
```bash
$ tail -f FILE
```
Remove new line and escape " symbols in the file
```bash
$ cat ORIGINFILE.TXT | tr -d '\n' | sed 's/"/\\"/g' > NEWFILE.TXT
```

Find a string recursively at path
```bash
$ grep -ir SEARCHABLE_STRING PATH
$ grep -A NUMBER_OF_LINES_AFTER -ir SEARCHABLE_STRING PATH
```

#### Zip
Zip files with password protecting
```bash
$ zip -er ZIP.zip file1 dir1 file2
```

#### Emacs
Copy from Emacs to OS X clipboard:
`select region then M-| pbcopy RET`

#### Midnight Commander
Open directory in another panel `ESC+o`




