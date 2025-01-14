Send the file over to computers
```bash
nc -l 1234 > filename
```
```bash
nc remote 1234 < filename
```

To run `netcat` in the listening mode and automatically send a message once client has connected
```bash
# GNU version of netcat
echo "Welcome to Ihar's Server" | nc -l <PORT>
# or
echo "Welcome to Ihar's Server" | nc -l -p <PORT>
```
