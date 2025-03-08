set -gx EDITOR nvim

fish_add_path -gP "/usr/local/bin" "/opt/homebrew/bin" "/opt/homebrew/sbin" "$HOME/go/bin"

if status is-interactive
    # Commands to run in interactive sessions can go here
    fzf --fish | source
    [ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish
end

bind -M insert \cr history-pager

# Colorscheme: Dracula
set -U fish_color_normal f8f8f2
set -U fish_color_command 8be9fd
set -U fish_color_keyword ff79c6
set -U fish_color_quote f1fa8c
set -U fish_color_redirection f8f8f2
set -U fish_color_end ffb86c
set -U fish_color_error ff5555
set -U fish_color_param bd93f9
set -U fish_color_comment 6272a4
set -U fish_color_match --background=brblue
set -U fish_color_selection --background=44475a
set -U fish_color_search_match --background=44475a
set -U fish_color_history_current --bold
set -U fish_color_operator 50fa7b
set -U fish_color_escape ff79c6
set -U fish_color_cwd 50fa7b
set -U fish_color_cwd_root red
set -U fish_color_option ffb86c
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 6272a4
set -U fish_color_user 8be9fd
set -U fish_color_host bd93f9
set -U fish_color_host_remote bd93f9
set -U fish_color_history_current --bold
set -U fish_color_status ff5555
set -U fish_color_cancel ff5555 --reverse
set -U fish_pager_color_background
set -U fish_pager_color_prefix 8be9fd
set -U fish_pager_color_progress 6272a4
set -U fish_pager_color_completion f8f8f2
set -U fish_pager_color_description 6272a4
set -U fish_pager_color_selected_background --background=44475a
set -U fish_pager_color_selected_prefix 8be9fd
set -U fish_pager_color_selected_completion f8f8f2
set -U fish_pager_color_selected_description 6272a4
set -U fish_pager_color_secondary_prefix
set -U fish_pager_color_secondary_description
set -U fish_pager_color_secondary_completion
set -U fish_pager_color_secondary_background
