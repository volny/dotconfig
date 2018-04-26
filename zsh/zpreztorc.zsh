# Color output (auto set to 'no' on dumb terminals).
zstyle ':prezto:*:*' color 'yes'

# Set the Prezto modules to load (browse modules).
# The order matters.
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'fasd' \
  'prompt' \
  'git'

# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':prezto:module:editor' key-bindings 'vi'

# Ignore submodules when they are 'dirty', 'untracked', 'all', or 'none'.
zstyle ':prezto:module:git:status:ignore' submodules 'all'
zstyle ':prezto:module:git:info:context:subcontext' format 'string'

zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'prompt'

# Auto start a session when Zsh is launched in a local terminal.
zstyle ':prezto:module:tmux:auto-start' local 'yes'

# Auto start a session when Zsh is launched in a SSH connection.
# zstyle ':prezto:module:tmux:auto-start' remote 'yes'

# Integrate with iTerm2.
zstyle ':prezto:module:tmux:iterm' integrate 'yes'

# Set the default session name:
zstyle ':prezto:module:tmux:session' name 'dev'
