{
    name: fuzzy_file
    modifier: control
    keycode: char_f
    mode: [emacs, vi_normal, vi_insert]
    event: {
        send: executehostcommand
        cmd: "commandline edit --append (
            glob -D **/*
            | input list --fuzzy
                $'Please choose a (ansi magenta)file(ansi reset) to (ansi cyan_underline)insert(ansi reset):'
        )"
    }
}
