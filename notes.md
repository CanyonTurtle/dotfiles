# Notes

These are for myself, remembering all the commands I am using.

## Bash
```
grep -r -l 'match' *filenames with matching content -recursive*
```

## Vim

#### Normal
```
"ayy *use the a register to store line*
yy *use the " register to store line*
shift+I *column insert while in visual block mode*
<Ctrl-W> = *even layout*
.,$v/hello/j *v conVerse of g selector, from current line to end, join
```

#### Ex
```
:argdo {cmd} *runs on all buffers in arglist*
:<c-r> {register} *use register in command*
:args 'grep -r -l 'i hate vim' .'  *example of multifile find/replace with argdo*
:argdo %s/hate/love/g
```

#### Plugins
```
shift+I *column insert while in visual block mode*
cs'" *surround plugin*
```

## Tmux
```
C-F = leader
leader + alt + 1 *even layout*
```
