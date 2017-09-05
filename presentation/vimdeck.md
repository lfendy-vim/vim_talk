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

By Liauw Fendy and Nhong (Anuchit Prasertsang)


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
docker pull lfendy/vim_talk     # this will take a Loooong time
docker run -it -u someuser lfendy/vim_talk
```


# Ancient Scroll # 1: Meditate
(Nhong)
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
(Nhong)
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
(Fendy)
native packages...

```sh
.vim/pack/pluginGroup/start/zzz
.vim/pack/pluginGroup/opt/yyy

# opt need to use :packadd packagename
```


# Ancient Scroll # 1: Meditate
(Fendy)
analyse yourself

```sh
vim -w keylog.out
```


# Ancient Scroll # 2: Accelerate
(Fendy)
remember past sessions

```vim
:mks! mysession.vim
:source mysession.vim
"or
vim -S mysession.vim
```


# Ancient Scroll # 2: Accelerate
(Nhong)
Save file using sudo

```sh
vim ~/sample/root_owned_file.conf
:w !sudo tee %
```


# Ancient Scroll # 2: Accelerate
(Nhong)
The ungodly :W

```sh
:cnoreabbrev W w
```


# Ancient Scroll # 2: Accelerate
(Nhong)
The stupid wtf q:, I can't QUIT ?!?!

```sh
# it is not stupid:
# you can edit history
# you can use your vim keys in command mode
```


# Ancient Scroll # 2: Accelerate
(Nhong)
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
(Fendy)
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
(Nhong)
Try something easy:

```ruby
line comment 0010_line_comment_this.rb
```


# Ancient Scroll # 2: Accelerate
(Nhong)
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
(Nhong)
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
(Nhong)
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
(Fendy)
Uppercase the 2nd character of each line

```ruby
0020_upcase_line.md
```


# Ancient Scroll # 3: Formulate
(Fendy)
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
(Fendy)
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
(Fendy)
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
(Fendy)
Pretty Print Json (Using an external program)

```ruby
0030_minified_json.md
```

Note: python -m json.tool is installed


# Ancient Scroll # 3: Formulate
(Fendy)
Pretty Print Json (Using an external program)

```ruby
0030_minified_json.md
```

```vim
:%! python -m json.tool
```


# Ancient Scroll # 3: Formulate
(Fendy)
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
(Fendy)
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
(Fendy)
Ctrl - O is your friend

```vim
" navigate back and forth between last jump
<C-o> navigates back
<C-i> navigates forward
```


# Ancient Scroll # 4: Navigate
(Fendy)
Using cscope (starscope)

```sh
starscope -e cscope
```

```vim
# try treetop
vim lib/treetop/compiler/metagrammar.rb
:cs add ./cscope.out
:csc find s SyntaxNode
" then type number
```


# Ancient Scroll # 5: Reflect
(Fendy)
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
- Substituting \/\/\/\/
- :Codi - async jobs and channels
- Exercise: line comment

Formulate - and automate
- Exercises
- vimscript translate

Navigate - teleport and jump
- ctags - ctrl ]
- ctrl - o and ctrl - i
- cscope using starscope
