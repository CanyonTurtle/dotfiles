# Notes

These are for myself, remembering all the commands / language tips I am using.

## Bash
```
grep -r -l 'match' *filenames with matching content -recursive*
```

## Vim

#### Normal
```
ma *mark at a*
'a jump to a (OVERPOWERED)
% *jump to opposite brace*
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

## Declaring function pointers
```
arr    //arr 
arr [] //is an array (so index it)
* arr [] //of pointers (so dereference them)
(* arr [])() //to functions taking nothing (so call them with ())
void (* arr [])() //returning void 
so your answer is

void (* arr [])() = {};
But naturally, this is a bad practice, just use typedefs :)

Extra: Wonder how to declare an array of 3 pointers to functions taking int and returning a pointer to an array of 4 pointers to functions taking double and returning char? (how cool is that, huh? :))

arr //arr
arr [3] //is an array of 3 (index it)
* arr [3] //pointers
(* arr [3])(int) //to functions taking int (call it) and
*(* arr [3])(int) //returning a pointer (dereference it)
(*(* arr [3])(int))[4] //to an array of 4
*(*(* arr [3])(int))[4] //pointers
(*(*(* arr [3])(int))[4])(double) //to functions taking double and
char  (*(*(* arr [3])(int))[4])(double) //returning char
-Armen Tsirunyan, StackOverflow
```
