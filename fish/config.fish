if status is-interactive
    # Commands to run in interactive sessions can go here
end

thefuck --alias | source
set -g fish_greeting ""

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/dylan/miniconda3/bin/conda
    eval /home/dylan/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/dylan/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/dylan/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/dylan/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

