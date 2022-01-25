#### Print object (object where we send message to)
```bash 
$ po $arg1
```

#### One-shot breakpoint 
```bash
$ breakpoint set --one-shot true --name "-[UILabel setText:]"
```

#### 
```bash
$ bmessage -[MyViewController viewDidAppear:]
```

#### Assign address to variable and print info
```bash
$ e CALayer* $a = (CALayer *)0x600002e804a0
$ po $a
```
