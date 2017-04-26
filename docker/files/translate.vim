function! GetVisualSelection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

function! Translate(lang)
  let selections = GetVisualSelection()
  let command = "trans -b :" . a:lang . " " . selections . " 2>/dev/null"
  let result = substitute(system(command), "[^[:print:]]", " ", "g")
  return result
endfunction

vnoremap <leader>tr <Esc>:s/<C-R>=GetVisualSelection()<CR>/<C-R>=Translate("es")<CR>/<CR>
