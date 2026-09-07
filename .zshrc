export CLICOLOR=1

# Enable native Zsh version control info
autoload -Uz vcs_info
precmd() { vcs_info }

# Format Git branch display: (branch_name)
zstyle ':vcs_info:git:*' formats ' (%b)'

# Enable dynamic variable expansion in PROMPT
setopt PROMPT_SUBST

# Minimalist Prompt: Cyan Path | Yellow Git Branch | Green/Red Prompt Symbol
PROMPT='%F{cyan}%~%f%F{yellow}${vcs_info_msg_0_}%f %(?.%F{green}.%F{red})❯%f '

