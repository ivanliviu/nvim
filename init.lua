_G.arista = os.getenv 'TRACEFORMAT' ~= nil

require 'core'

require 'plugins'

-- NOTE: track updates to kickstart
-- NOTE: `:verbose set <setting>?` blames values

-- NOTE: paths:
-- ~/.config/nvim or $XDG_CONFIG_HOME/nvim - config
-- ~/.local/share/nvim or $XDG_DATA_HOME/nvim - installed plugins, runtime files
-- ~/.local/state/nvim or $XDG_STATE_HOME/nvim - edit state (e.g. undo history)
-- ~/.cache/nvim or $XDG_CACHE_HOME/nvim - cache, logs
-- ? /etc/xdg/nvim, /usr/share/nvim, /usr/local/share/nvim
