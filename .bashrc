[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"

export AWS_PROFILE=aws_mfa_session
source ~/Projects/seenthis/dev-tools/awslogin/aws_session_token.sh
