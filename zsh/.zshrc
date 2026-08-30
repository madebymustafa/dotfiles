# =============================================================================
#  .zshrc: Zsh configuration
# =============================================================================

# ─── Powerlevel10k ──────────────────────────────────────────────────────────
# Instant prompt block: must stay near the top. Anything that needs console
# input (passwords, confirmations, etc.) must go *above* this.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ─── Oh My Zsh ──────────────────────────────────────────────────────────────
# Framework: aliases, completions, theme/plugin loading, `omz` updater.
# Powerlevel10k and the zsh plugins below are cloned into $ZSH_CUSTOM by
# install.sh, so this block stays identical on a brand-new machine.

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting  # must stay last: wraps live widgets/completions
)

[[ -r "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# ─── Shell history ──────────────────────────────────────────────────────────
# Persists command history across sessions with deduplication.
#
#   share_history          - share history between running sessions
#   hist_expire_dups_first - purge duplicates first when HISTFILE overflows
#   hist_ignore_dups       - skip consecutive duplicates
#   hist_verify            - let me edit history expansions before running

HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# ─── XDG base directory ─────────────────────────────────────────────────────
# Keep config files out of ~/ by following the XDG Base Directory spec.

export XDG_CONFIG_HOME="$HOME/.config"

# ─── Key bindings ───────────────────────────────────────────────────────────
# ↑/↓  partial-match history search (type a prefix, then arrow through matches)

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ─── Zsh plugins (autosuggestions, syntax-highlighting) ─────────────────────
# Loaded by Oh My Zsh above from $ZSH_CUSTOM/plugins (managed by install.sh).

# ─── FZF: fuzzy finder ────────────────────────────────────────────────────
#   Ctrl-T  → pick files/directories   Ctrl-R  → search history
#   Alt-C   → fuzzy cd into subdirectory
# Replaces default completions (kill <TAB>, ssh <TAB>, etc.) with fuzzy ones.

eval "$(fzf --zsh)"

# Tokyonight-inspired colour palette
fg="#CBE0F0"   bg="#011628"   bg_highlight="#143652"
purple="#B388FF"   blue="#06BCE4"   cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# Use `fd` as the file/directory source for FZF
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() { fd --hidden --exclude .git . "$1" }
_fzf_compgen_dir()  { fd --type=d --hidden --exclude .git . "$1" }

# Preview pane: directories → eza tree | files → bat (syntax-highlighted)
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Command-specific previews for tab completion
_fzf_comprun() {
  local command=$1; shift
  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@"  ;;
    export|unset) fzf --preview "eval 'echo \${}'"                         "$@"  ;;
    ssh)          fzf --preview 'dig {}'                                   "$@"  ;;
    *)            fzf --preview "$show_file_or_dir_preview"                "$@"  ;;
  esac
}

# ─── Editor ─────────────────────────────────────────────────────────────────
# Default $EDITOR for Git, visudo, etc.

export EDITOR="nvim"

# ─── PATH ───────────────────────────────────────────────────────────────────

export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="$PATH:/Users/mustafa/.lmstudio/bin"


# ─── Secrets (sourced from ~/.env, kept out of the dotfiles repo) ───────────
[ -f "$HOME/.env" ] && source "$HOME/.env"

# =============================================================================
#  FUNCTIONS
# =============================================================================

# ─── Yazi ───────────────────────────────────────────────────────────────────
# Terminal file manager wrapper: auto-cd into the last directory on quit.

function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# =============================================================================
#  ALIASES
# =============================================================================

# Use `trash` (https://github.com/sindresorhus/trash-cli) instead of permanent delete
alias rm=trash
alias reload-zsh="source ~/.zshrc"
alias   edit-zsh="nvim   ~/.zshrc"

# ── Starship ──────────────────────────────────────────────────────────────────
# Starship prompt config lives at ~/.config/starship/starship.toml.
# Uncomment below to switch from Powerlevel10k to starship.
#
# eval "$(starship init zsh)"

alias cursor='cursor --classic'

# ── Eza ──────────────────────────────────────────────────────────────────────
# Modern `ls` replacement with Git status, icons, and tree views.

alias l="eza --icons"
alias ls="eza --icons"
alias ll="eza -lg --icons"
alias la="eza -lag --icons"
alias lt="eza -lTg --icons"
alias lt1="eza -lTg --level=1 --icons"
alias lt2="eza -lTg --level=2 --icons"
alias lt3="eza -lTg --level=3 --icons"
alias lta="eza -lTag --icons"
alias lta1="eza -lTag --level=1 --icons"
alias lta2="eza -lTag --level=2 --icons"
alias lta3="eza -lTag --level=3 --icons"

# ── TheFuck ──────────────────────────────────────────────────────────────────
# Correct mistyped commands: `fuck` to fix, `tf` for the short version.

eval "$(thefuck --alias)"
eval "$(thefuck --alias tf)"

# ── Zoxide ───────────────────────────────────────────────────────────────────
# Smart `cd` that learns your most-used directories.  `z down` → ~/Downloads.
#
# `cd` uses real `cd` when given an existing path (so `cd ~/something` and
# `cd /abs/path` always work), and falls back to zoxide's fuzzy `z` for jumps
# (`cd down` → ~/Downloads). Previously `alias cd="z"` sent every `cd` through
# zoxide, which mis-handled `~/` expansion and threw
# `zsh: permission denied: $HOME`.

eval "$(zoxide init zsh)"
# `unalias cd` first: zsh refuses to define a function named after an alias
# ("defining function based on alias 'cd'"), and various plugins (oh-my-zsh,
# etc.) can leave a `cd` alias in scope when this line is sourced.
unalias cd 2>/dev/null
cd() {
  if [[ $# -ge 1 && -d "$1" ]]; then
    builtin cd "$1"
  else
    z "$@"
  fi
}

eval "$(atuin init zsh)"

# ── Television ────────────────────────────────────────────────────────────────
# Fuzzy-finder (TUI) for files, git branches, processes, and more.
# Config at ~/.config/television/config.toml
alias tv="television"

# ── Sesh ────────────────────────────────────────────────────────────────────────
# tmux session manager: prefix+T in tmux, or Alt-s in zsh to open picker

function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions

# Following line was automatically added by arttime installer
export MANPATH=/Users/mustafa/.local/share/man:$MANPATH

# Qwen Code PATH block begin
export PATH='/Users/mustafa/.local/bin':$PATH
# Qwen Code PATH block end

# bun completions
[ -s "/Users/mustafa/.bun/_bun" ] && source "/Users/mustafa/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# >>> codex free-model providers >>>
[ -f "$HOME/.codex/free-keys.env" ] && set -a && source "$HOME/.codex/free-keys.env" && set +a
# <<< codex free-model providers <<<

# >>> codex free aliases >>>
# Type "codex-" then press TAB to see both. Plain `codex` stays your ChatGPT plan.
alias codex-free='codex --profile free-openrouter'    # free-models menu (Nemotron Super default)
alias codex-ox='codex --profile openrouter-ox-alpha'  # Ox Alpha directly
# <<< codex free aliases <<<

. "$HOME/.atuin/bin/env"
