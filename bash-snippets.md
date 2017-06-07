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
`select region then M-| pbcopy RET`<br/>
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

#### Emacs-Magit


| Emacs                                                                | Emacs-Magit                                              | Vim  |
| -------------------------------------------------------------------- |:--------------------------------------------------------:| -------------------------------------------------:|
| `C-x 0` - delete the selected window (`delete-window`)               | `M-x magit-process-buffer` - to show the output of recently run git commands         | $1600 |

#### Midnight Commander
Open directory in another panel `ESC+o`




