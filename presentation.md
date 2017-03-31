# Become a Vim-ja

Do you even vim, brah?


# Pre-requisites

- git clone

```shell
  git clone https://github.com/lfendy-vim/become-a-vimja.git
```

- Vim 8.0 with no plugins

```shell
  mv ~/.vim ~/.vim_bak
  mv ~/.vimc~/.vimrc_bak
```

- or through docker

```shell
  docker pull rmohta/alpine-vim8:base
  docker run -it -v `pwd`:/app rmohta/alpine-vim8:base vim /app
```


# Agenda:

- Vim-golf type of exercise against different scenarios




# Start with something easy:

## Line comment a bunch of code

```
#using column select
5G\<C-v>11GI#\<esc>

#using command-line range and regex substitution
:5,11 s/^/#/\<cr>

#using macros
5Gqq0i#\<esc>jq6@q
```

## Upcase the second character of a bunch of lines

```
#using column select
ggl\<C-v>25j~

#using command-line range and regex
:%s/.\(\w\)/\U\1/\<cr>

#using macros
ggqq^l~jq25@q

```

## Upcase the second word of every line

```

#using cmdline range and regex
:%s/\(^\w\+ \)\(\w\+\)/\1\U\2/

#using macros
ggqqwve~j^q25@q


```

## Upcase the second word of every sentence


