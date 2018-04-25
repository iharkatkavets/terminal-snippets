# Snippets

* [Xcode Archive IPA signing](./ios-ipa-signing.md)<br>
* [Bash Terminal](./bash-snippets.md)<br>
* [Xcode debuger extension Chisel](./chisel-debug-snippets.md)<br>
* [Xcode shortcuts](./xcode-shortcuts.md)<br>


## CURL
Download and find and count occurances of `regex_pattern` in response (by adding new line `\\\n`)
```bash
$ curl  -v --silent 'http://awesome.com' 2>&1 | sed $'s/regex_pattern/regex_pattern\\\n/g' | grep -c 'regex_pattern'
```

### Git
Clean up submodules
```bash
$ git submodule foreach --recursive git clean -x -f -d
```
