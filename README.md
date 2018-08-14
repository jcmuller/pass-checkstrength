# pass checkstrength

An extension for the [password store](https://www.passwordstore.org/)
that checks the strength of all your passwords using libcrack2.

## pass checkstrength

`pass checkstrength` checks all passwords with cracklib-check, and
prints out the password file name of the offending passwords, with a
reason why.

```bash
$ pass checkstrength
foobarbaz.org: it is based on a dictionary word
example.com: it is too simplistic/systematic
```

## Installation

- Enable password-store extensions by setting ``PASSWORD_STORE_ENABLE_EXTENSIONS=true``
- Add this repo as a submodule to your password store and create a symlink to `checkstrength.bash` in `~/.password-store/.extensions`

## Contribution

Contributions are always welcome.
