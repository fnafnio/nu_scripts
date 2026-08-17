{
    name: fuzzy_zoxide
    modifier: control
    keycode: char_y
    mode: [emacs, vi_normal, vi_insert]
    event: {
        send: executehostcommand
        cmd: "commandline edit --append (
            zoxide query --interactive
            | default ''
        )"
    }
}
