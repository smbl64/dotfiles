return {
  -- Markdown
  'godlygeek/tabular',
  'preservim/vim-markdown',

  -- Working with ollama
  'David-Kunz/gen.nvim',


  'inkarkat/vim-ingo-library',
  'inkarkat/vim-mark',
  'dense-analysis/ale',
  'ludovicchabant/vim-gutentags',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-unimpaired',
  'tpope/vim-fugitive',

  -- Run tests in any language
  'vim-test/vim-test',

  'smbl64/vim-black-macchiato',

  'lervag/vimtex',

  -- Web development
  'pangloss/vim-javascript',
  'maxmellon/vim-jsx-pretty',
  'hail2u/vim-css3-syntax',

  {
    'ray-x/go.nvim',
    config = true,
  },

  'mrk21/yaml-vim',
  'hashivim/vim-terraform',
  'isobit/vim-caddyfile',
  'rodjek/vim-puppet',
  'timmyjose-projects/lox.vim',
  'dart-lang/dart-vim-plugin',
  'ziglang/zig.vim',

  -- Allow local vimrc files
  'jenterkin/vim-autosource',


  'simrat39/rust-tools.nvim',

  'folke/which-key.nvim',

  {
    "NoahTheDuke/vim-just",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "justfile", "*.just", ".justfile" },
  }
}
