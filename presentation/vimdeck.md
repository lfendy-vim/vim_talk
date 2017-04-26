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
- can use :x,ys/^/#/
- can use <C-v>


# Ancient Scroll # 3: Automation


# Ancient Scroll # 4: Navigation
Using tags

```sh
ctags -R *
:set tags=/path/to/tags-file
```


# Acient Scroll # 4: Navigation
Using cscope (starscope)




