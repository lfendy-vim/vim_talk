## Line Comment
```
5G\<esc>V11G\<esc>:s/^/#/\<cr>
```
Is usually how I would do this, Not sure if its worth adding, as all of yours worrk quicker

### Descriptions of how they work (more for me)
#### Column Select
- 5G - navigate to line 5
- \<C-v> - Enter column select mode
- 11G - select until line 11
- I - enter insert mode & move to begining of line
- # - insert the # character
- /<esc> - exit column select
Question why 'I' and not 'i' ?

#### Regex
- : - enter command modei
- 5,11 - range of regex
- s - substitute
- ^ - begining of line
- # - # character
- /<cr> execute substitution

### Macro
- 5G go to line 5
- q - record macro
- q - asign macro to q (maybe we cange this?)
- 0 - begining of line
- i - insert mode
- # - # character
- /<esc> - navigation mode
- j - move to next line
- q - stop recording macro
- 6@q - replay macro 'q' 6 times


## Uppercase
#### Column Select
- gg - go to the top of file
- l - move across
- <C-v> - enter column select
- 25 - Go to line 25
- j - move down
- ~ - toggle case

alternitivly
```
ggl\<C-v>Gl~
```
Will go to the end of file rather than effectivlyline 26

#### Command Line
I had a little trouble, the one in here was stripping the 1st character
```
:%s/^\(.\)\(\w\)/\1\U\2/<cr>
```
- : - command mode
- % - whole file
- s - subtitute
- ^ - start of line
- \(.\) - backreference 1st character
- \(\w\) - backreference 2nd character
- \1 - repace with 1st character
- \U - uppercase
- \2 - replace 2nd backreference

Or if we assume 1st is already capicat/needs to be capital
```
:%s/^\(\w\w\)/U\1/<cr>
```

#### Macro
- gg - go to top of file
- q - record macro
- q assign macro to q
- ^ - start of line
- l - right one character
- ~ - toggle case
- j - down 1 character
- q - finish macro
- 25@q - execute macro 25 times

### Upercase 2nd word of every line
### Cmd/Regex
- : - command mode
- % - whole file
- s - subtitute
- \(.\) - backreference 1st character
- \(\w\) - backreference 2nd character
- \1 - repace with 1st character
- \U - uppercase
- \2 - replace 2nd backreference

#### Macro
- gg - go to top of file
- q - record macro
- q assign macro to q
- w - go to next word
- enter visual mode
- select to end of word
~ - toggle case
j - down one
^ - start of line
- q - finish macro
- 25@q - execute macro 25 times

## Uppercase the 2nd word in every sentence
This was the best I could do
```
:%s/\(^\|\.\s*\)\(\w\+ \)\(\w\+\)/\1\2\U\3/g
```
