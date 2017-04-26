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


# Ancient Scroll # 1: Meditation
Some sane defaults (normal)

```sh
vim ./sanevimrc
set nocompat
set number
set syntax=on
set undodir=/tmp/
set hlsearch

vim -u ./sanevimrc a_config_file.cfg
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

vim -u ./minvimrc a_huge_file.log
```


# Ancient Scroll # 2: Acceleration
Save file using sudo

```sh
vim rootfile.txt
:w !sudo tee %
```


# Ancient Scroll # 3: Automation





# Ancient Scroll # 4: Navigation
Using tags

```sh
ctags -R *
:set tags=/path/to/tags-file
```


# Acient Scroll # 4: Navigation
Alternate files
