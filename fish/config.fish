if status is-interactive
    # Commands to run in interactive sessions can go here
end

thefuck --alias | source
set -g fish_greeting ""

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /usr/bin/conda
    eval /usr/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/usr/etc/fish/conf.d/conda.fish"
        . "/usr/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/usr/bin" $PATH
    end
end
# <<< conda initialize <<<

