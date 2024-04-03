# ## google cloud sdkの導入
# source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
# source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
#
# # Rustの設定
# source $HOME/.cargo/env
#
# # leetcode-cli
eval "$(leetcode completions)"
alias lc='leetcode'


export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"


function abc() {
    local contest_id="$1"
    local problem_id="$2"

    if [[ -z "$contest_id" ]] || [[ -z "$problem_id" ]]; then
        echo "コンテストIDと問題IDを指定してください。"
        return 1
    fi

    local problem_url="https://atcoder.jp/contests/abc${contest_id}/tasks/abc${contest_id}_${problem_id}"

    open "$problem_url"
}

function agc() {
    local contest_id="$1"
    local problem_id="$2"

    if [[ -z "$contest_id" ]] || [[ -z "$problem_id" ]]; then
        echo "コンテストIDと問題IDを指定してください。"
        return 1
    fi

    local problem_url="https://atcoder.jp/contests/agc${contest_id}/tasks/agc${contest_id}_${problem_id}"

    open "$problem_url"
}

function atc() {
    local contest_id="$1"
    local problem_id="$2"

    if [[ -z "$contest_id" ]] || [[ -z "$problem_id" ]]; then
        echo "コンテストIDと問題IDを指定してください。"
        return 1
    fi

    local problem_url="https://atcoder.jp/contests/${contest_id}/tasks/${contest_id}_${problem_id}"

    open "$problem_url"
}


# 日報を開く
function nippo() {
    issue_number=$(gh issue list -R Takahiro800/nippo --label "nippo" --limit 1 --json number |jq -r '.[0].number')
    gh issue view -R Takahiro800/nippo $issue_number --web
}

