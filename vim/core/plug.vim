if g:flag == "good"
  " vim-plug
  " Automatic installation
  "let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
  "if empty(glob(data_dir . '/autoload/plug.vim'))
  "  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  "  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  "endif

  " vim-plug conditional activation
  function! Cond(cond, ...)
    let opts = get(a:000, 0, {})
    return a:cond ? opts : extend(opts, {'on': [], 'for': []})
  endfunction

  call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-fugitive' | Plug 'rbong/vim-flog'
  Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'morhetz/gruvbox'
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'edkolev/tmuxline.vim' " See tmuxline.vim settings section
  Plug 'lervag/vimtex'
  Plug 'godlygeek/tabular' " tabular plugin must come before vim-markdown
  Plug 'plasticboy/vim-markdown' | Plug 'JamshedVesuna/vim-markdown-preview'
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  Plug 'psliwka/vim-smoothie'
  Plug 'skywind3000/Leaderf-snippet'
  Plug 'mhinz/vim-startify'
  Plug 'jdhao/better-escape.vim'
  Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
  Plug 'ryanoasis/vim-devicons'
  Plug 'Yggdroot/LeaderF', Cond(!has('nvim-0.5'), {'do': ':LeaderfInstallCExtension'})
  Plug 'neoclide/coc.nvim', Cond(has('nvim'))
  Plug 'norcalli/nvim-colorizer.lua', Cond(has('nvim'))
  Plug 'nvim-lua/popup.nvim', Cond(has('nvim'))
  Plug 'nvim-lua/plenary.nvim', Cond(has('nvim'))
  Plug 'nvim-treesitter/nvim-treesitter', Cond(has('nvim-0.5'), {'do': ':TSUpdate'})
  Plug 'nvim-telescope/telescope.nvim', Cond(has('nvim-0.5'))
  Plug 'kyazdani42/nvim-web-devicons', Cond(has('nvim')) " For telescope.nvim
  Plug 'Rykka/riv.vim'
  Plug 'rhysd/committia.vim'
  Plug 'kevinhwang91/nvim-hlslens', Cond(has('nvim-0.5'))
  Plug 'kevinhwang91/nvim-bqf', Cond(has('nvim-0.5'))
  Plug 'dstein64/vim-startuptime'
  call plug#end()
endif
