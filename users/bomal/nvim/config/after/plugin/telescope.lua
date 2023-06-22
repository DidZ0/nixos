local builtin = require('telescope.builtin')
local wk = require('which-key')
wk.register({
  f = {
    name = 'Find',
    f = { builtin.find_files, 'Find Files' },
    t = { builtin.file_browser, 'File Browser' },
    b = { builtin.buffers, 'Buffers' },
    r = { builtin.oldfiles, 'Recent Files' },
    g = { builtin.live_grep, 'Live Grep' },
    h = { builtin.help_tags, 'Help Tags' },
  },
}, { prefix = '<leader>' })

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
