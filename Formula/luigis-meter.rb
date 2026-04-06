class LuigisMeter < Formula
  desc "Claude Code Max quota meter, live in your statusline"
  homepage "https://github.com/Luigigreco/luigis-meter"
  url "https://github.com/Luigigreco/luigis-meter/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "f8d1e1f5d98db0582307d464697c118b3761a1260ce049100488cf7dde6610ae"
  license "MIT"
  version "0.2.0"

  depends_on "jq"

  def install
    bin.install "luigis-meter.sh" => "luigis-meter"
  end

  def caveats
    <<~EOS
      luigis-meter is installed as a CLI script at:
        #{bin}/luigis-meter

      To integrate it into your Claude Code statusline, add the following
      to ~/.claude/statusline.sh (or create it if missing):

        METER_LINE=$(luigis-meter 2>/dev/null)
        echo -e "$YOUR_MAIN_LINE"
        [ -n "$METER_LINE" ] && echo -e "$METER_LINE"

      Calibrate defaults for your Claude plan:
        https://github.com/Luigigreco/luigis-meter#calibration

      Override limits via env vars:
        export CLAUDE_MAX_5H_TOKENS=192000
        export CLAUDE_MAX_WEEKLY_TOKENS=3250000
    EOS
  end

  test do
    # Smoke test: the script should print output and exit 0 even with no
    # Claude Code projects directory present.
    output = shell_output("#{bin}/luigis-meter")
    assert_match(/sess left|resetting|estimate/i, output.empty? ? "ok" : output)
  end
end
