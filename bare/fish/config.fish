if status is-interactive
    # Commands to run in interactive sessions can go here
    set EDITOR nvim
end

fish_add_path -gP "/opt/homebrew/bin" "/opt/homebrew/sbin" "$HOME/go/bin"
