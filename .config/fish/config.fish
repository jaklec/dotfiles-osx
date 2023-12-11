if status is-interactive
    # Commands to run in interactive sessions can go here

    eval (/opt/homebrew/bin/brew shellenv)
    fzf_key_bindings
    # bind ç fzf-cd-widget

    eval (ssh-agent -c) >/dev/null
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID

    set -gx PATH /opt/homebrew/opt/curl/bin:$PATH
    set -gx PATH $HOME/.cargo/bin:$PATH

    set -gx FZF_DEFAULT_COMMAND 'rg --files'
    set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
    set -gx FZF_ALT_C_COMMAND "fd --type directory . $HOME"
    set -gx FZF_ALT_C_OPTS "--preview 'tree -C {} | HEAD -200'"
    set -gx FZF_CTRL_T_OPTS "--preview 'highlight -O ansi -l {} 2> /dev/null'"

    set -gx VISUAL nvim
    set -gx EDITOR $VISUAL

    source $HOME/.tokens.fish
    source ~/.aliases

    fnm env | source
end

fish_add_path ~/.docker/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set --export AWS_PROFILE aws_mfa_session
source ~/Projects/seenthis/dev-tools/awslogin/aws_session_token.fish
