local function statusline()
  local mode = vim.fn.mode()
  local parts = {}

  -- Mode indicator
  if mode == 'n' then
    table.insert(parts, '%#CursorIM#  NORMAL ')
  elseif mode == 'i' then
    table.insert(parts, '%#Search#  INSERT ')
  elseif mode == 'r' then
    table.insert(parts, '%#DiffDelete#  RPLACE ')
  elseif mode == 'v' or mode == 'V' or mode == '\22' then
    table.insert(parts, '%#Cursor#  VISUAL ')
  else
    table.insert(parts, '%#CursorIM#')
  end

  -- Paste / Spell
  table.insert(parts, '%#Visual#')
  if vim.o.paste then table.insert(parts, ' PASTE ') end
  if vim.o.spell then table.insert(parts, ' SPELL ') end

  -- Flags
  table.insert(parts, '%#CursorIM#%R%M')

  -- File name
  table.insert(parts, '%#CursorLine# %f ')

  -- Right side
  table.insert(parts, '%=')

  -- File type
  table.insert(parts, '%#CursorLine# %y ')

  -- Line/col
  table.insert(parts, '%#CursorIM# %3l:%-2c ')

  -- Percentage
  table.insert(parts, '%#CursorIM# %3p%% ')

  return table.concat(parts)
end

vim.o.statusline = '%!v:lua.Statusline()'
_G.Statusline = statusline
