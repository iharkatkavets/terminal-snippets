### `swiftc` usage examples

```bash 
swiftc main.swift -O -emit-sil -o main.sil
```
where `-O` means optimisation level, could be:</br>
`-O` - This is the default value, which enables optimizations for speed and size, but disables some checks such as overflow checking and assertions</br>
`-Ounchecked` - This disables all optimizations and preserves the intermediate representation of the code for debugging purposes. This option also enables overflow checking and assertions</br>
`-Onone` - This disables all optimizations and preserves the intermediate representation of the code for debugging purposes. This option also enables overflow checking and assertions</br>
`-Osize` - This optimizes the code for size rather than speed, which may result in slower execution but smaller binary size</br>
