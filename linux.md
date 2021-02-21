# LINUX

## Create single parted hard drive
```bash
$ sudo parted
$(parted) select /dev/sdX 
$(parted) mklabel gpt
$(parted) mkpart P1 xfs 0% 100%
$(parted) quit
```

## Mount hard drive permanantely
```bash
$ sudo blkid
$ vim /etc/fstab
...
UUID=d21c3ed8-f5c8-4895-b6b7-8682bfe9de9d  /mnt/DRIVE_256GB  xfs  defaults  0  2
...
$ mount -a 
$ chown user /mnt/DRIVE_256GB
$ chmod +rwx /mnt/DRIVE_256GB
