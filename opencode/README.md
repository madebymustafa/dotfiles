# opencode

Agent configs for the opencode CLI.

- `agents/` - subagent definitions (architect-designer, tech-lead,
  test-automation-engineer, requirements-clarifier, etc.)
- `commands/` - custom slash commands
- `skills/` - project skills the agent can load. `avoid-ai-writing` links to
  `~/.agents/skills/avoid-ai-writing`, which `install.sh` clones. The link is
  relative to this repo, so it resolves only when the repo is at `~/dotfiles`.
- `opencode.jsonc` - main config: model, providers, MCP, experimental flags
- `tui.json` - TUI preferences
