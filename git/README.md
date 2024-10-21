# Git configuration

## Per workspace config
To have different configs in a directory and _all its subdirectories_, add the following to `config` file:

```gitconfig
[includeIf "gitdir/i:~/Projects/"
path = ~/Projects/.gitconfig
```

This would include configs set in `~/Projects/.gitonfig` file for any project under `~/Projects/`.

