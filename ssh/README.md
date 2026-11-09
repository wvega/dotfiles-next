# SSH configuration

## Approach

The `config` file holds the two `Include` lines only. All settings live in
snippet files. `setup.sh` links the shared snippets and the snippets for the
current OS into `~/.ssh/config.d`.

OpenSSH reads the files top to bottom. For each keyword it keeps the first
value it finds. Later files can add keywords, but they cannot replace an
earlier value.

## Layout

```
ssh/
  config                      # Include lines only
  config.d/                   # shared, linked on every host
    20-host-defaults.config
  macos/config.d/             # linked on macOS only
    10-keychain.config
  linux/config.d/             # linked on Linux only
```

Prefixes set the read order. The glob sorts by name, not by number, so always
zero-pad: `10-` sorts before `20-`, but `2-` sorts after `20-`.

Ranges:

| Range  | Owner                         |
|--------|-------------------------------|
| `01-09`| Private overrides             |
| `10-19`| OS-specific settings          |
| `20-89`| Shared settings               |
| `90-99`| Host entries                  |

A private file needs the lowest prefix to win over a shared file. The private
files live in `private/ssh/config.d` and are linked by the same script.

## Ordering rule

Put each keyword in one file only. With one owner per keyword the sort order
does not matter, and no setting silently overrides another.

To check for duplicates:

```bash
grep -hE '^[[:space:]]+[A-Za-z]' ssh/config.d/*.config ssh/*/config.d/*.config \
    | awk '{ print tolower($1) }' | sort | uniq -d
```

No output means no keyword appears twice.

## Deployment

```bash
./ssh/setup.sh
```

The script links the shared snippets, then the snippets for `uname -s`, then
the private snippets. It also removes links whose target no longer exists.

It puts the repo's `.dotfiles` directory first on PATH, the same way the root
`setup.sh` does. It always uses the helper from this checkout, and it works
before `~/bin` is on PATH. It stops on the first error.

## Verify

Print the resolved configuration and compare it before and after a change:

```bash
ssh -G example.com > /tmp/ssh-after.txt
diff /tmp/ssh-before.txt /tmp/ssh-after.txt
```

## Caveats

1. `UseKeychain` is a macOS extension. A Linux build of OpenSSH stops with
   `Bad configuration option: usekeychain`. Keep it in `macos/config.d`.
2. An unknown keyword is fatal. `UseKeychain` is an Apple option, so only the
   macOS file sets it. If a shared file ever needs an option that one platform
   does not know, guard it with `IgnoreUnknown <Name>`.
3. Start each snippet with its own `Host` block. A snippet is read in the
   context of the `Include` line, so a bare keyword has no fixed scope.
4. Link individual files and keep `~/.ssh/config.d` a real directory. The
   private snippets are written into that same directory.
5. Use `~` in `Include` paths. An absolute path breaks on another host or
   user.
