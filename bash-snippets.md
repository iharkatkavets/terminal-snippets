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

#### Git-Emacs
`select region then M-| pbcopy RET`
`m` - mark the file the cursor is on ATM
`M` - mark all files in buffer
`u/DEL` - unmark file below/above
`R` - resolve conflicts during merge
`a` - add file to repository
`r` - remove file
`i` - add file to ignore list
`c` - commit
`U` - Undo -> revert file
`l` - see log file
`g` - refresh the status buffer
`q` - quit status buffer
`?` - get help!

#### Midnight Commander
Open directory in another panel `ESC+o`




