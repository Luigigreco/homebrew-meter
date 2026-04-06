# homebrew-meter

Homebrew tap for [luigis-meter](https://github.com/Luigigreco/luigis-meter) —
the Claude Code Max quota meter, live in your statusline.

## Install

```bash
brew tap luigigreco/meter
brew install luigis-meter
```

That's it. `luigis-meter` will be in your `$PATH` and ready to wire into
your Claude Code statusline.

## Usage

Add this snippet to your `~/.claude/statusline.sh`:

```bash
# luigis-meter — Claude Code Max quota estimate
METER_LINE=$(luigis-meter 2>/dev/null)
# ... your existing echo "$LINE" goes here ...
[ -n "$METER_LINE" ] && echo -e "$METER_LINE"
```

Open a new Claude Code window — you should see a second statusline row:

```
lm ⏱ sess left: 85% (2h 13m left) · week left: 39% (reset Fri 14:00) · estimate
```

## Configuration

Tune the limits for your plan by adding to `~/.zshrc`:

```bash
export CLAUDE_MAX_5H_TOKENS=192000       # default for Max 20x
export CLAUDE_MAX_WEEKLY_TOKENS=3250000  # default for Max 20x
```

See the [calibration guide](https://github.com/Luigigreco/luigis-meter/blob/main/docs/CALIBRATION.md)
to match Claude Code's built-in `/usage` popup.

## Upgrade

```bash
brew update
brew upgrade luigis-meter
```

## Uninstall

```bash
brew uninstall luigis-meter
brew untap luigigreco/meter
```

## Related

- Main repo: [Luigigreco/luigis-meter](https://github.com/Luigigreco/luigis-meter)
- Issues: [Luigigreco/luigis-meter/issues](https://github.com/Luigigreco/luigis-meter/issues)
- Author: [@luigigreco on X](https://x.com/luigigreco)

## License

MIT — same as luigis-meter.
