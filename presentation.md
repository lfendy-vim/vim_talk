# Title

# Agenda

# How to

visit: http://vimuser:vimuser@127.0.0.1:1337/
ssh vimuser@127.0.0.1


































# Become a Vim-ja

Do you even vim, brah?


# Pre-requisites

- ssh
- connect to the network

```shell
  ssh vimuser@10.0.0.10
```

# Agenda:

- Vim-golf type of exercise against different scenarios




# Start with something easy:

## Save something in sudo immediately

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



