# BIN

## Functions

### Add path to .zshrc

```
fpath=( ~/bin/functions "${fpath[@]}" )
```

### Adding a function

```
autoload -Uz <functionName>
```

### Remove a function

```
unset -f <functionName>
```

### List

#### dpext

Used to set the external screen brightness

```
dpext -b=0.7
```

## Sync

### .env

|Options|Value|
|-|-|
|DEST|Destination path|

### Run

> Every sync is defaulted to a dry-run

#### All recipes

```
make all -f sync.mk
```

#### Per recipe

```
make sync-bin -f sync.mk
```

#### Production

```
DRY=false make all -f sync.mk
```
