### Files editing 
`$ tail -f FILE` - Display file changes in real time<br/>
`$ cat ORIGINFILE.TXT | tr -d '\n' | sed 's/"/\\"/g' > NEWFILE.TXT` - Remove new line and escape " symbols in the file<br/>
`$ grep -ir SEARCHABLE_STRING PATH` - Find a string recursively at path<br/>
`$ grep -A NUMBER_OF_LINES_AFTER -ir SEARCHABLE_STRING PATH`<br/>

`$ echo 'abc...1235abc..' | wc -c` - count characters in string

### Zip
`$ zip -er ZIP.zip file1 dir1 file2` - Zip files with password protecting<br/>

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




