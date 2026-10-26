-- Rex config: https://www.superlogical.com/rex/docs/customize/config
-- Apply changes with `rex config reload`; validate with `rex config check`.
-- See current bindings with `rex keymap` and available actions with `rex actions -C <client>`.

-- Focus panes (vim-style)
rex.bind("cmd+h", "pane.focus.left")
rex.bind("cmd+j", "pane.focus.down")
rex.bind("cmd+k", "pane.focus.up")
rex.bind("cmd+l", "pane.focus.right")

-- Split panes
rex.bind("cmd+shift+h", "pane.split.left")
rex.bind("cmd+shift+j", "pane.split.down")
rex.bind("cmd+shift+k", "pane.split.up")
rex.bind("cmd+shift+l", "pane.split.right")

-- Tabs
rex.bind("cmd+n", "client.tab.new")
rex.bind("cmd+up", "client.tab.previous")
rex.bind("cmd+down", "client.tab.next")

-- Sessions
rex.bind("cmd+shift+n", "session.new")
rex.bind("cmd+shift+up", "session.previous")
rex.bind("cmd+shift+down", "session.next")
