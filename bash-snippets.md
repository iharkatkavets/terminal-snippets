Bash snippets


#### Files editing 
Display file changes in real time
```bash
$ tail -f FILE
```
Remve new line and escape " symbols in the file
```bash
$ cat ORIGINFILE.TXT | tr -d '\n' | sed 's/"/\\"/g' > NEWFILE.TXT
```

#### Zip
Zip files with password protecting
```bash
$ zip -er ZIP.zip file1 dir1 file2
```




