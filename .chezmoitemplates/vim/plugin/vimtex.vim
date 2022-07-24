let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk_engines = {'_': '-xelatex'}
let g:vimtex_view_method = 'skim'
"let g:vimtex_mappings_enabled = 1
let g:vimtex_syntax_custom_cmds = [
      \ {'name': 'ce', 'argspell': 0},
      \ {'name': 'zref', 'argspell': 0},
      \]
let g:vimtex_syntax_nospell_comments = 1
let g:vimtex_grammar_vlty = {'lt_command': 'languagetool'}
let g:vimtex_grammar_vlty.shell_options =
      \ ' --multi-language'
let g:vimtex_grammar_textidote = {
      \ 'jar': '~/textidote.jar',
      \ 'args': '--check en',
      \}
let g:vimtex_compiler_latexmk = {
      \ 'build_dir' : '',
      \ 'callback' : 1,
      \ 'continuous' : 1,
      \ 'executable' : 'latexmk',
      \ 'hooks' : [],
      \ 'options' : [
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \   '-shell-escape',
      \ ],
      \}
let g:vimtex_syntax_packages = {'minted': {'load': 2}}

"let g:airline#extensions#vimtex#main = "/"
"if has('nvim')
"  g:vimtex_compiler_progname = 'nvr'
"endif

command TexRoot silent exe 'cd' b:vimtex.root
nmap <leader>l/ :TexRoot<CR>

command TexReset silent exe ':VimtexStop' | exe ':VimtexClean' | exe '!rm' b:vimtex.root .. '/*.bbl'
nmap <leader>ld :TexReset<CR>

" Remap <leader>lt
nmap <leader>lt :VimtexTocToggle<CR>
