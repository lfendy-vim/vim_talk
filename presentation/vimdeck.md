# Become a Vim-ja
## Team Hug OZ 2017
```markdown
                                            ..
                                          .::::.
                             ___________ :;;;;:`____________
                             \_________/ ?????L \__________/
                               |.....| ????????> :.......'
                               |:::::| $$$$$$"`.:::::::' ,
                              ,|:::::| $$$$"`.:::::::' .OOS.
                            ,7D|;;;;;| $$"`.;;;;;;;' .OOO888S.
                          .GDDD|;;;;;| ?`.;;;;;;;' .OO8DDDDDNNS.
                           'DDO|IIIII| .7IIIII7' .DDDDDDDDNNNF`
                             'D|IIIIII7IIIII7' .DDDDDDDDNNNF`
                               |EEEEEEEEEE7' .DDDDDDDNNNNF`
                               |EEEEEEEEZ' .DDDDDDDDNNNF`
                               |888888Z' .DDDDDDDDNNNF`
                               |8888Z' ,DDDDDDDNNNNF`
                               |88Z'    "DNNNNNNN"
                               '"'        "MMMM"
                                            ""
```

## All you need is VIM

By Liauw Fendy and Aaron Edwards


# Agenda

- Vim-ja meditate   (Setup your machine)
- Vim-ja accelerate (Handle scenarios lyk a Baus)
- Vim-ja formulate  (Macros)
- Vim-ja navigate   (Learn teleportation)


# Ancient Scroll # 1: Meditation
## Setup your machine

Browse http://vimuser:vimuser@10.0.0.4:1337/

```sh
ssh vimuser@10.0.0.5
```

or

```sh
docker pull lfendy/vim_talk     # this will take a Loooong time
```


# Ancient Scroll # 1: Meditation
Some sane defaults (normal)

```sh
vim ./sanevimrc
set nocompatible
set number
syntax on
set undofile
set undodir=/tmp/
set hlsearch

vim -u ~/sample/sanevimrc ~/sample/httpd.conf
```


# Ancient Scroll # 1: Meditation
Same sane defaults (large files)

```sh
vim ./minvimrc

set eventignore+=FileType

" save memory when other file is viewed
setlocal bufhidden=unload

" is read-only (write with :w new_filename)
setlocal buftype=nowrite

" no undo possible
setlocal undolevels=-1

bash < createlargefile.sh
time vim -u ~/sample/sanevimrc ~/sample/largefile.txt -c ":q"
time vim -u ~/sample/minvimrc ~/sample/largefile.txt -c ":q"
```


# Ancient Scroll # 1: Meditation
native packages...

```sh
.vim/pack/pluginGroup/start/zzz
.vim/pack/pluginGroup/opt/yyy
```


# Ancient Scroll # 2: Acceleration
Save file using sudo

```sh
vim ~/sample/root_owned_file.conf
:w !sudo tee %
```


# Ancient Scroll # 2: Acceleration
The ungodly :W

```sh
:cnoreabbrev W w
```


# Ancient Scroll # 2: Acceleration
Vim 8 async job and channels demo (Codi) - live repl

```sh
vim test.rb

def add2num(x,y)
  x + y
end
a = add2num(2,3)
:Codi ruby
```


# Ancient Scroll # 2: Acceleration
Try something easy:

line comment 0010_line_comment_this.rb


# Ancient Scroll # 2: Acceleration
Try something easy:

line comment 0010_line_comment_this.rb
```
#using column select
5G\<C-v>11GI#\<esc>
```
- 5G      - go to line 5
- \<C-v>  - Enter column select mode
- 11G     - select until line 11
- I       - insert
- #       - type #
- /<esc>  - exit column select


# Ancient Scroll # 2: Acceleration
Try something easy:

line comment 0010_line_comment_this.rb
```
#using command-line range and regex substitution
:5,11 s/^/#/\<cr>
```
- :     - enter command mode
- 5,11  - range of regex
- s     - substitute
- ^     - begining of line
- #     - # character
- /<cr> - execute substitution


# Ancient Scroll # 2: Acceleration
Try something easy:

line comment 0010_line_comment_this.rb
```
#using macros
5Gqq0i#\<esc>jq6@q
```
- 5G     - go to line 5
- q      - record macro
- q      - asign macro to q
- 0      - begining of line
- i      - insert mode
- #      - # character
- /<esc> - navigation mode
- j      - move to next line
- q      - stop recording macro
- 6@q    - replay macro 'q' 6 times


# Ancient Scroll # 3: Automation
Upercase the 2nd character of each line

0020_upercase_line.md


# Ancient Scroll # 3: Automation
Upercase the 2nd character of each line

0020_upercase_line.md

```
#using column select
ggl\<C-v>25j~
```
- gg    - go to the top of file
- l     - move across
- <C-v> - enter column select
- 25    - Go to line 25
- j     - move down
- ~     - toggle case


# Ancient Scroll # 3: Automation
Upercase the 2nd character of each line

0020_upercase_line.md

```
#using command-line range and regex
:%s/^\(.\)\(\w\)/\1\U\2/<cr>
```
- :       - command mode
- %       - whole file
- s       - subtitute
- ^       - start of line
- \(.\)   - backreference 1st character
- \(\w\)  - backreference 2nd character
- \1      - repace with 1st character
- \U      - uppercase
- \2      - replace 2nd backreference


# Ancient Scroll # 3: Automation
Upercase the 2nd character of each line

0020_upercase_line.md

```
#using macros
ggqq^l~jq25@q

```
- gg    - go to top of file
- q     - record macro
- q     - assign macro to q
- ^     - start of line
- l     - right one character
- ~     - toggle case
- j     - down 1 character
- q     - finish macro
- 25@q  - execute macro 25 times


# Ancient Scroll # 3: Automation
Upercase the 2nd word of each line

0020_upercase_line.md


# Ancient Scroll # 3: Automation
Upercase the 2nd word of each line

0020_upercase_line.md
```
#using cmdline range and regex
:%s/\(^\w\+ \)\(\w\+\)/\1\U\2/

```
- :           - command mode
- %           - whole file
- s           - subtitute
- \(^\w\+ \)  - match beginning of line followed by 1 or more word characters and a space
- \(^\w\+\)   - match beginning of line followed by 1 or more word characters
- \1          - repace with 1st word
- \U\2        - uppercase 2nd word


# Ancient Scroll # 3: Automation
Upercase the 2nd word of each line

0020_upercase_line.md
```
#using macros
ggqqwve~j^q25@q
```
- gg    - go to top of file
- q     - record macro
- q     - assign macro to q
- w     - go to next word
- v     - enter visual mode
- e     - select to end of word
- ~     - toggle case
- j     - down one
- ^     - start of line
- q     - finish macro
- 25@q  - execute macro 25 times


# Ancient Scroll # 3: Automation
Upercase the 2nd word of every sentence

0021_upercase_sentence.md


# Ancient Scroll # 3: Automation
Upercase the 2nd word of every sentence

0021_upercase_sentence.md
```
#using cmdline range and regex
:%s/\(^\|\.\s\+\)\(\w\+ \)\(\w\+\)/\1\2\U\3/g

```
- :             - command mode
- %             - whole file
- s             - subtitute
- \(^\|\.\s\+\) - Either Begining of line OR '.' followed by 1 or more whitespace
- \(^\w\+ \)    - match beginning of line followed by 1 or more word characters and a space
- \(^\w\+\)     - match beginning of line followed by 1 or more word characters
- \1            - begging or full stop + whitespace
- \2            - 1st word
- \U\3          - uppercase 2nd word


# Ancient Scroll # 3: Automation
Upercase the 2nd word of every sentence

0021_upercase_sentence.md
```
#using macros
ggqqwve~)q25@q
```
- gg    - go to top of file
- q     - record macro
- q     - assign macro to q
- w     - go to next word
- v     - enter visual mode
- e     - select to end of word
- ~     - toggle case
- )     - go to next senence
- q     - finish macro
- 25@q  - execute macro 25 times


# Ancient Scroll # 3: Automation
Pretty Print Json (Using an external program)

0031_minified_json.md

Note: python -m json.tool is installed


# Ancient Scroll # 3: Automation
Pretty Print Json (Using an external program)

0031_minified_json.md

```
:%! python -m json.tool
```


# Ancient Scroll # 4: Navigation
Using tags

```sh
ctags -R *
:set tags=/path/to/tags-file
```


# Acient Scroll # 4: Navigation
Using cscope (starscope)




