# LINUX

## parted
```bash
$ sudo parted
$(parted) select /dev/sdX 
$(parted) mklabel gpt
$(parted) mkpart P1 xfs 0% 100%
$(parted) quit
```
