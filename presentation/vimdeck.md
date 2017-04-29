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


# Vim-ja mantras
## (Agenda)

- Vim-ja meditate   (Setup your machine)
- Vim-ja accelerate (Handle scenarios lyk a Baus)
- Vim-ja formulate  (Macros)
- Vim-ja navigate   (Learn teleportation)
- Vim-ja reflect    (Summary)


# Ancient Scroll # 1: Meditate
## Setup your machine

```sh
# Browse http://10.0.0.5:1337/
ssh vimuser@10.0.0.9

# OR you can do this instead, but will take a really long time

docker pull lfendy/vim_talk     # this will take a Loooong time
```


# Ancient Scroll # 1: Meditate
Some sane defaults (normal)

```vim
vim ./sanevimrc
set nocompatible
set number
syntax on
set undofile
set undodir=/tmp/
set hlsearch

vim -u ~/sample/sanevimrc ~/sample/httpd.conf
```


# Ancient Scroll # 1: Meditate
Same sane defaults (large files)

```vim
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


# Ancient Scroll # 1: Meditate
native packages...

```sh
.vim/pack/pluginGroup/start/zzz
.vim/pack/pluginGroup/opt/yyy

# opt need to use :packadd packagename
```


# Ancient Scroll # 1: Meditate
analyse yourself

```sh
vim -w keylog.out
```


# Ancient Scroll # 2: Accelerate
remember past sessions

```vim
:mks! mysession.vim
:source mysession.vim
"or
vim -S mysession.vim
```


# Ancient Scroll # 2: Accelerate
Save file using sudo

```sh
vim ~/sample/root_owned_file.conf
:w !sudo tee %
```


# Ancient Scroll # 2: Accelerate
The ungodly :W

```sh
:cnoreabbrev W w
```


# Ancient Scroll # 2: Accelerate
The stupid wtf q:, I can't QUIT ?!?!

```sh
# it is not stupid:
# you can edit history
# you can use your vim keys in command mode
```


# Ancient Scroll # 2: Accelerate
Substituting \/\/\/\/

```vim
vim substitute_this
/home/user/vimuser/magic/folder/text
/home/user/vimuser/someother/magic/folder/text
https://this.is.theurl.com/to/a/resource

:%s/home\/user\/vimuser/var\/magic\/root/gc
:s/home\/user\/vimuser/var\/magic\/root/gc
```


# Ancient Scroll # 2: Accelerate
Vim 8 async job and channels demo (Codi) - live repl

```ruby
vim test.rb

def add2num(x,y)
  x + y
end
a = add2num(2,3)
:Codi ruby
```


# Ancient Scroll # 2: Accelerate
Try something easy:

```ruby
line comment 0010_line_comment_this.rb
```


# Ancient Scroll # 2: Accelerate
Try something easy:

```ruby
line comment 0010_line_comment_this.rb
```

```vim
#using column select
5G\<C-v>11GI#\<esc>
```

- 5G      - go to line 5
- \<C-v>  - Enter column select mode
- 11G     - select until line 11
- I       - insert
- #       - type #
- /<esc>  - exit column select


# Ancient Scroll # 2: Accelerate
Try something easy:

```ruby
line comment 0010_line_comment_this.rb
```

```vim
#using regex substitution
:5,11 s/^/#/\<cr>
```

- :     - enter command mode
- 5,11  - range of regex
- s     - substitute
- ^     - beginning of line
- #     - # character
- /<cr> - execute substitution


# Ancient Scroll # 2: Accelerate
Try something easy:

```ruby
line comment 0010_line_comment_this.rb
```

```vim
#using macros
5Gqq0i#\<esc>jq6@q
```

- 5G     - go to line 5
- q      - record macro
- q      - assign macro to q
- 0      - beginning of line
- i      - insert mode
- #      - # character
- /<esc> - navigation mode
- j      - move to next line
- q      - stop recording macro
- 6@q    - replay macro 'q' 6 times


# Ancient Scroll # 3: Formulate
Uppercase the 2nd character of each line

```ruby
0020_upcase_line.md
```


# Ancient Scroll # 3: Formulate
Uppercase the 2nd character of each line

```ruby
0020_upcase_line.md
```

```vim
#using column select
ggl\<C-v>25j~
```

- gg    - go to the top of file
- l     - move across
- <C-v> - enter column select
- 25    - Go to line 25
- j     - move down
- ~     - toggle case


# Ancient Scroll # 3: Formulate
Uppercase the 2nd character of each line

```ruby
0020_upcase_line.md
```

```vim
#using regex subsitution
:%s/^\(.\)\(\w\)/\1\U\2/<cr>
```
- :       - command mode
- %       - whole file
- s       - substitute
- ^       - start of line
- \(.\)   - back reference 1st character
- \(\w\)  - back reference 2nd character
- \1      - replace with 1st character
- \U      - uppercase
- \2      - replace 2nd back reference


# Ancient Scroll # 3: Formulate
Upercase the 2nd character of each line

```ruby
0020_upcase_line.md
```

```vim
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


# Ancient Scroll # 3: Formulate
Uppercase the 2nd word of each line

```ruby
0020_upcase_line.md
```


# Ancient Scroll # 3: Formulate
Uppercase the 2nd word of each line

```ruby
0020_upcase_line.md
```

```vim
#using regex substitution
:%s/\(^\w\+ \)\(\w\+\)/\1\U\2/
```

- :           - command mode
- %           - whole file
- s           - substitute
- \(^\w\+ \)  - match beginning of line followed by 1 or more word characters and a space
- \(^\w\+\)   - match beginning of line followed by 1 or more word characters
- \1          - replace with 1st word
- \U\2        - uppercase 2nd word


# Ancient Scroll # 3: Formulate
Uppercase the 2nd word of each line

```ruby
0020_upcase_line.md
```

```vim
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


# Ancient Scroll # 3: Formulate
Uppercase the 2nd word of every sentence

```ruby
0021_upcase_sentence.md
```


# Ancient Scroll # 3: Formulate
Uppercase the 2nd word of every sentence

```ruby
0021_upcase_sentence.md
```

```vim
#using regex substitution
:%s/\(^\|\.\s\+\)\(\w\+ \)\(\w\+\)/\1\2\U\3/g
```

- :             - command mode
- %             - whole file
- s             - substitute
- \(^\|\.\s\+\) - Either beginning of line OR '.' followed by 1 or more whitespace
- \(^\w\+ \)    - match beginning of line followed by 1 or more word characters and a space
- \(^\w\+\)     - match beginning of line followed by 1 or more word characters
- \1            - begging or full stop + whitespace
- \2            - 1st word
- \U\3          - uppercase 2nd word


# Ancient Scroll # 3: Formulate
Uppercase the 2nd word of every sentence

```ruby
0021_upcase_sentence.md
```

```vim
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
- )     - go to next sentence
- q     - finish macro
- 25@q  - execute macro 25 times


# Ancient Scroll # 3: Formulate
Pretty Print Json (Using an external program)

```ruby
0030_minified_json.md
```

Note: python -m json.tool is installed


# Ancient Scroll # 3: Formulate
Pretty Print Json (Using an external program)

```ruby
0030_minified_json.md
```

```vim
:%! python -m json.tool
```


# Ancient Scroll # 3: Formulate
How to do internationalisation / localisation

```sh
vim -u sample/sanewimvrc strings.xml
```

```vim
:source sample/translate.vim
visual select
<leader>tr
```


# Ancient Scroll # 4: Navigate
using tags

```sh
ctags -R *
```

```vim
# try joda-time
:set tags=/path/to/tags-file
- <C-]> - jump to definition
```


# Ancient Scroll #4: Navigate
Ctrl - O is your friend

```vim
" navigate back and forth between last jump
<C-o> navigates back
<C-i> navigates forward
```


# Ancient Scroll # 4: Navigate
Using cscope (starscope)


# Ancient Scroll # 5: Reflect
What we discussed:

Meditate - vim setups
- sane defaults normal files
- sane defaults large files
- vim 8 native packages
- output keylog

Accelerate - those minor annoyances
- session
- sudo save
- :W
- q:
- :Codi - async jobs and channels
- Exercise: line comment

Formulate - and automate
- Exercises
- vimscript translate

Navigate - teleport and jump
- ctags - ctrl ]
- ctrl - o and ctrl - i
- cscope using starscope
