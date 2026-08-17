# herdr - terminal workspace manager for AI coding agents
# https://github.com/herdrdev/herdr

def "nu-complete herdr sessions" [] {
    try {
        ^herdr session list --json
        | from json
        | get sessions
        | each {|session|
            {
                value: $session.name
                description: (if $session.running { "running" } else { "stopped" })
            }
        }
    } catch { [] }
}

def "nu-complete herdr shells" [] { [bash elvish fish powershell zsh] }
def "nu-complete herdr channels" [] { [stable preview] }
def "nu-complete herdr remote keybindings" [] { [local server] }
def "nu-complete herdr directions" [] { [left right up down] }
def "nu-complete herdr split directions" [] { [right down] }
def "nu-complete herdr statuses" [] { [idle working blocked done unknown] }
def "nu-complete herdr pane states" [] { [idle working blocked unknown] }
def "nu-complete herdr read sources" [] { [visible recent recent-unwrapped detection] }
def "nu-complete herdr wait sources" [] { [visible recent recent-unwrapped] }
def "nu-complete herdr text formats" [] { [text ansi] }
def "nu-complete herdr output formats" [] { [text json] }
def "nu-complete herdr right click targets" [] { [herdr pane] }
def "nu-complete herdr notification positions" [] { [top-left top-right bottom-left bottom-right] }
def "nu-complete herdr notification sounds" [] { [none done request] }
def "nu-complete herdr plugin placements" [] { [overlay split tab zoomed] }
def "nu-complete herdr agents" [] {
    [pi claude codex gemini cursor devin agy cline omp mastracode opencode copilot kimi kiro droid amp grok hermes kilo qodercli qwen maki]
}
def "nu-complete herdr integrations" [] {
    [pi omp claude codex copilot devin droid kimi opencode kilo hermes qodercli qwen cursor mastracode antigravity-cli grok]
}

def "nu-complete herdr commands" [] {
    [
        [value description];
        [completion "Generate shell completion scripts"]
        [completions "Alias for completion"]
        [update "Download and install the latest version"]
        [status "Show local client and running server status"]
        [config "Manage local configuration"]
        [channel "Manage stable and preview update channels"]
        [server "Run or control the headless server"]
        [api "Inspect socket API metadata and live runtime state"]
        [workspace "Manage workspaces over the socket API"]
        [worktree "Manage Git worktree-backed workspaces"]
        [tab "Manage tabs over the socket API"]
        [notification "Show Herdr notifications"]
        [agent "Control and inspect agent panes"]
        [pane "Control terminal panes"]
        [terminal "Attach to or observe raw terminal streams"]
        [session "Manage named persistent sessions"]
        [integration "Manage built-in agent integrations"]
        [plugin "Install and run workflow plugins"]
    ]
}

def "nu-complete herdr status commands" [] { [[value description]; [server "Show running server status"] [client "Show local client status"]] }
def "nu-complete herdr config commands" [] { [[value description]; [check "Validate config.toml and print diagnostics"] [reset-keys "Reset custom keybindings"]] }
def "nu-complete herdr channel commands" [] { [[value description]; [show "Print the configured update channel"] [set "Choose the update channel"]] }
def "nu-complete herdr server commands" [] { [[value description]; [stop "Stop the running server"] [reload-config "Reload config in the running server"] [agent-manifests "Show active agent detection manifests"] [update-agent-manifests "Fetch and reload agent detection manifests"] [reload-agent-manifests "Reload local agent detection manifest overrides"]] }
def "nu-complete herdr api commands" [] { [[value description]; [snapshot "Print the live session snapshot"] [schema "Print or write the bundled API schema"]] }
def "nu-complete herdr workspace commands" [] { [[value description]; [list "List workspaces"] [create "Create a workspace"] [get "Show a workspace"] [focus "Focus a workspace"] [rename "Rename a workspace"] [report-metadata "Report display-only workspace metadata"] [close "Close a workspace"]] }
def "nu-complete herdr worktree commands" [] { [[value description]; [list "List worktree workspaces"] [create "Create and open a Git worktree"] [open "Open an existing Git worktree"] [remove "Remove a worktree checkout"]] }
def "nu-complete herdr tab commands" [] { [[value description]; [list "List tabs"] [create "Create a tab"] [get "Show a tab"] [focus "Focus a tab"] [rename "Rename a tab"] [close "Close a tab"]] }
def "nu-complete herdr notification commands" [] { [[value description]; [show "Show a notification"]] }
def "nu-complete herdr agent commands" [] { [[value description]; [list "List agents"] [get "Show an agent"] [read "Read agent terminal output"] [send-keys "Send key presses to an agent"] [prompt "Submit a prompt to an agent"] [rename "Rename an agent"] [focus "Focus an agent"] [wait "Wait until an agent reaches a requested state"] [attach "Attach directly to an agent terminal"] [start "Start a supported interactive agent"] [explain "Explain agent detection state"]] }
def "nu-complete herdr pane commands" [] { [[value description]; [list "List panes"] [current "Show the current pane"] [get "Show a pane"] [layout "Show pane layout information"] [process-info "Show pane process information"] [neighbor "Find a pane neighbor"] [edges "Show pane edge information"] [focus "Focus a neighboring pane"] [resize "Resize a pane split"] [zoom "Toggle or set pane zoom"] [read "Read pane terminal output"] [rename "Rename a pane"] [input "Set pane input routing"] [split "Split a pane"] [swap "Swap panes"] [move "Move a pane"] [close "Close a pane"] [send-text "Send literal text to a pane"] [send-keys "Send key presses to a pane"] [wait-output "Wait for matching pane output"] [run "Run a command in a pane"] [report-agent "Report pane agent lifecycle state"] [report-agent-session "Report pane agent session identity"] [release-agent "Release pane agent lifecycle authority"] [report-metadata "Report display-only pane metadata"]] }
def "nu-complete herdr terminal commands" [] { [[value description]; [attach "Attach directly to a terminal stream"] [session "Work with terminal sessions"] [title "Manage the outer terminal title"]] }
def "nu-complete herdr terminal session commands" [] { [[value description]; [control "Control a terminal stream"] [observe "Observe a terminal stream"]] }
def "nu-complete herdr terminal title commands" [] { [[value description]; [set "Set the outer terminal title"] [clear "Clear the outer terminal title"]] }
def "nu-complete herdr session commands" [] { [[value description]; [list "List sessions"] [attach "Attach to a session"] [stop "Stop a session"] [delete "Delete a stopped session"]] }
def "nu-complete herdr integration commands" [] { [[value description]; [install "Install an integration"] [uninstall "Uninstall an integration"] [status "Show integration status"]] }
def "nu-complete herdr plugin commands" [] { [[value description]; [install "Install a plugin from GitHub"] [uninstall "Uninstall a plugin"] [link "Link a local plugin"] [unlink "Unlink a local plugin"] [enable "Enable a plugin"] [disable "Disable a plugin"] [list "List installed plugins"] [config-dir "Print a plugin config directory"] [action "List or invoke plugin actions"] [log "Inspect plugin command logs"] [logs "Alias for log"] [pane "Manage plugin-owned panes"]] }
def "nu-complete herdr plugin action commands" [] { [[value description]; [list "List plugin actions"] [invoke "Invoke a plugin action"]] }
def "nu-complete herdr plugin log commands" [] { [[value description]; [list "List plugin command logs"]] }
def "nu-complete herdr plugin pane commands" [] { [[value description]; [open "Open a plugin pane"] [focus "Focus a plugin pane"] [close "Close a plugin pane"]] }

# terminal workspace manager for AI coding agents
export extern "herdr" [
    command?: string@"nu-complete herdr commands"
    --no-session                  # Run without server/client session mode
    --session: string@"nu-complete herdr sessions" # Use or create a named session
    --remote: string              # Attach through SSH to a remote Herdr server
    --remote-keybindings: string@"nu-complete herdr remote keybindings"
    --handoff                     # Opt into live handoff
    --default-config              # Print default configuration and exit
    --skill                       # Print the agent skill file and exit
    --version(-V)                 # Print version and exit
    --help(-h)                    # Show help
]

export extern "herdr completion" [shell: string@"nu-complete herdr shells"]
export extern "herdr completions" [shell: string@"nu-complete herdr shells"]
export extern "herdr update" [--handoff --help(-h)]
export extern "herdr status" [command?: string@"nu-complete herdr status commands" --json --help(-h)]
export extern "herdr status server" [--json --help(-h)]
export extern "herdr status client" [--json --help(-h)]
export extern "herdr config" [command?: string@"nu-complete herdr config commands" --help(-h)]
export extern "herdr config check" [--help(-h)]
export extern "herdr config reset-keys" [--help(-h)]
export extern "herdr channel" [command?: string@"nu-complete herdr channel commands" --help(-h)]
export extern "herdr channel show" [--help(-h)]
export extern "herdr channel set" [channel: string@"nu-complete herdr channels" --help(-h)]
export extern "herdr server" [command?: string@"nu-complete herdr server commands" --help(-h)]
export extern "herdr server stop" [--help(-h)]
export extern "herdr server reload-config" [--help(-h)]
export extern "herdr server agent-manifests" [--json --help(-h)]
export extern "herdr server update-agent-manifests" [--json --help(-h)]
export extern "herdr server reload-agent-manifests" [--help(-h)]
export extern "herdr api" [command?: string@"nu-complete herdr api commands" --help(-h)]
export extern "herdr api snapshot" [--help(-h)]
export extern "herdr api schema" [--json --output: path --help(-h)]

export extern "herdr workspace" [command?: string@"nu-complete herdr workspace commands" --help(-h)]
export extern "herdr workspace list" [--help(-h)]
export extern "herdr workspace create" [--cwd: path --label: string --env: string --focus --no-focus --help(-h)]
export extern "herdr workspace get" [workspace_id: string --help(-h)]
export extern "herdr workspace focus" [workspace_id: string --help(-h)]
export extern "herdr workspace rename" [workspace_id: string ...label: string --help(-h)]
export extern "herdr workspace report-metadata" [workspace_id: string --source: string --token: string --clear-token: string --seq: int --ttl-ms: int --help(-h)]
export extern "herdr workspace close" [workspace_id: string --help(-h)]

export extern "herdr worktree" [command?: string@"nu-complete herdr worktree commands" --help(-h)]
export extern "herdr worktree list" [--workspace: string --cwd: path --help(-h)]
export extern "herdr worktree create" [--workspace: string --cwd: path --branch: string --base: string --path: path --label: string --focus --no-focus --help(-h)]
export extern "herdr worktree open" [--workspace: string --cwd: path --path: path --branch: string --label: string --focus --no-focus --help(-h)]
export extern "herdr worktree remove" [--workspace: string --force --help(-h)]

export extern "herdr tab" [command?: string@"nu-complete herdr tab commands" --help(-h)]
export extern "herdr tab list" [--workspace: string --help(-h)]
export extern "herdr tab create" [--workspace: string --cwd: path --label: string --env: string --focus --no-focus --help(-h)]
export extern "herdr tab get" [tab_id: string --help(-h)]
export extern "herdr tab focus" [tab_id: string --help(-h)]
export extern "herdr tab rename" [tab_id: string ...label: string --help(-h)]
export extern "herdr tab close" [tab_id: string --help(-h)]
export extern "herdr notification" [command?: string@"nu-complete herdr notification commands" --help(-h)]
export extern "herdr notification show" [title: string --body: string --position: string@"nu-complete herdr notification positions" --sound: string@"nu-complete herdr notification sounds" --help(-h)]

export extern "herdr agent" [command?: string@"nu-complete herdr agent commands" --help(-h)]
export extern "herdr agent list" [--help(-h)]
export extern "herdr agent get" [target: string --help(-h)]
export extern "herdr agent read" [target: string --source: string@"nu-complete herdr read sources" --lines: int --format: string@"nu-complete herdr text formats" --ansi --help(-h)]
export extern "herdr agent send-keys" [target: string ...key: string --help(-h)]
export extern "herdr agent prompt" [target: string text: string --wait --until: string@"nu-complete herdr statuses" --timeout: int --help(-h)]
export extern "herdr agent rename" [target: string name?: string --clear --help(-h)]
export extern "herdr agent focus" [target: string --help(-h)]
export extern "herdr agent wait" [target: string --until: string@"nu-complete herdr statuses" --timeout: int --help(-h)]
export extern "herdr agent attach" [target: string --takeover --help(-h)]
export extern "herdr agent start" [name: string --kind: string@"nu-complete herdr agents" --pane: string --timeout: int ...agent_arg: string --help(-h)]
export extern "herdr agent explain" [target?: string --file: path --agent: string --json --format: string@"nu-complete herdr output formats" --verbose(-v) --help(-h)]

export extern "herdr pane" [command?: string@"nu-complete herdr pane commands" --help(-h)]
export extern "herdr pane list" [--workspace: string --help(-h)]
export extern "herdr pane current" [--pane: string --current --help(-h)]
export extern "herdr pane get" [pane_id: string --help(-h)]
export extern "herdr pane layout" [--pane: string --current --help(-h)]
export extern "herdr pane process-info" [--pane: string --current --help(-h)]
export extern "herdr pane neighbor" [--direction: string@"nu-complete herdr directions" --pane: string --current --help(-h)]
export extern "herdr pane edges" [--pane: string --current --help(-h)]
export extern "herdr pane focus" [--direction: string@"nu-complete herdr directions" --pane: string --current --help(-h)]
export extern "herdr pane resize" [--direction: string@"nu-complete herdr directions" --amount: float --pane: string --current --help(-h)]
export extern "herdr pane zoom" [pane_id?: string --pane: string --current --toggle --on --off --help(-h)]
export extern "herdr pane read" [pane_id: string --source: string@"nu-complete herdr read sources" --lines: int --format: string@"nu-complete herdr text formats" --ansi --raw --help(-h)]
export extern "herdr pane rename" [pane_id: string ...label: string --clear --help(-h)]
export extern "herdr pane input" [pane_id?: string --pane: string --current --right-click: string@"nu-complete herdr right click targets" --help(-h)]
export extern "herdr pane split" [pane_id?: string --pane: string --current --direction: string@"nu-complete herdr split directions" --ratio: float --cwd: path --env: string --right-click: string@"nu-complete herdr right click targets" --focus --no-focus --help(-h)]
export extern "herdr pane swap" [--direction: string@"nu-complete herdr directions" --pane: string --current --source-pane: string --target-pane: string --help(-h)]
export extern "herdr pane move" [pane_id: string --tab: string --split: string@"nu-complete herdr split directions" --target-pane: string --ratio: float --new-tab --workspace: string --new-workspace --label: string --tab-label: string --focus --no-focus --help(-h)]
export extern "herdr pane close" [pane_id: string --help(-h)]
export extern "herdr pane send-text" [pane_id: string text: string --help(-h)]
export extern "herdr pane send-keys" [pane_id: string ...key: string --help(-h)]
export extern "herdr pane wait-output" [pane_id: string --match: string --regex: string --source: string@"nu-complete herdr wait sources" --lines: int --timeout: int --raw --help(-h)]
export extern "herdr pane run" [pane_id: string ...command: string --help(-h)]
export extern "herdr pane report-agent" [pane_id: string --source: string --agent: string --state: string@"nu-complete herdr pane states" --message: string --seq: int --agent-session-id: string --agent-session-path: path --help(-h)]
export extern "herdr pane report-agent-session" [pane_id: string --source: string --agent: string --seq: int --agent-session-id: string --agent-session-path: path --session-start-source: string --help(-h)]
export extern "herdr pane release-agent" [pane_id: string --source: string --agent: string --seq: int --help(-h)]
export extern "herdr pane report-metadata" [pane_id: string --source: string --agent: string --applies-to-source: string --title: string --clear-title --display-agent: string --clear-display-agent --state-label: string --clear-state-labels --token: string --clear-token: string --seq: int --ttl-ms: int --help(-h)]

export extern "herdr terminal" [command?: string@"nu-complete herdr terminal commands" --help(-h)]
export extern "herdr terminal attach" [terminal_id: string --takeover --help(-h)]
export extern "herdr terminal session" [command?: string@"nu-complete herdr terminal session commands" --help(-h)]
export extern "herdr terminal session control" [target: string --takeover --cols: int --rows: int --help(-h)]
export extern "herdr terminal session observe" [target: string --cols: int --rows: int --help(-h)]
export extern "herdr terminal title" [command?: string@"nu-complete herdr terminal title commands" --help(-h)]
export extern "herdr terminal title set" [title: string --help(-h)]
export extern "herdr terminal title clear" [--help(-h)]

export extern "herdr session" [command?: string@"nu-complete herdr session commands" --help(-h)]
export extern "herdr session list" [--json --help(-h)]
export extern "herdr session attach" [name: string@"nu-complete herdr sessions" --help(-h)]
export extern "herdr session stop" [name: string@"nu-complete herdr sessions" --json --help(-h)]
export extern "herdr session delete" [name: string@"nu-complete herdr sessions" --json --help(-h)]
export extern "herdr integration" [command?: string@"nu-complete herdr integration commands" --help(-h)]
export extern "herdr integration install" [target: string@"nu-complete herdr integrations" --help(-h)]
export extern "herdr integration uninstall" [target: string@"nu-complete herdr integrations" --help(-h)]
export extern "herdr integration status" [--outdated-only --help(-h)]

export extern "herdr plugin" [command?: string@"nu-complete herdr plugin commands" --help(-h)]
export extern "herdr plugin install" [source: string --ref: string --yes(-y) --help(-h)]
export extern "herdr plugin uninstall" [plugin: string --help(-h)]
export extern "herdr plugin link" [path: path --disabled --enabled --help(-h)]
export extern "herdr plugin unlink" [plugin_id: string --help(-h)]
export extern "herdr plugin enable" [plugin_id: string --help(-h)]
export extern "herdr plugin disable" [plugin_id: string --help(-h)]
export extern "herdr plugin list" [--plugin: string --json --help(-h)]
export extern "herdr plugin config-dir" [plugin_id: string --help(-h)]
export extern "herdr plugin action" [command?: string@"nu-complete herdr plugin action commands" --help(-h)]
export extern "herdr plugin action list" [--plugin: string --help(-h)]
export extern "herdr plugin action invoke" [action_id: string --plugin: string --help(-h)]
export extern "herdr plugin log" [command?: string@"nu-complete herdr plugin log commands" --help(-h)]
export extern "herdr plugin logs" [command?: string@"nu-complete herdr plugin log commands" --help(-h)]
export extern "herdr plugin log list" [--plugin: string --limit: int --help(-h)]
export extern "herdr plugin logs list" [--plugin: string --limit: int --help(-h)]
export extern "herdr plugin pane" [command?: string@"nu-complete herdr plugin pane commands" --help(-h)]
export extern "herdr plugin pane open" [--plugin: string --entrypoint: string --placement: string@"nu-complete herdr plugin placements" --workspace: string --target-pane: string --direction: string@"nu-complete herdr split directions" --cwd: path --env: string --focus --no-focus --help(-h)]
export extern "herdr plugin pane focus" [pane_id: string --help(-h)]
export extern "herdr plugin pane close" [pane_id: string --help(-h)]
