# Homebrew formula for the Polylane CLI.
#
# This file belongs in the tap repository (github.com/coreplanelabs/homebrew-tap)
# at Formula/polylane.rb so users can install via:
#
#   brew install coreplanelabs/tap/polylane
#
# The release pipeline bumps `url` / `sha256` / `version` on every new release —
# see the update-homebrew job in .github/workflows/release.yml.
class Polylane < Formula
  desc "Agent-focused CLI for the Polylane platform"
  homepage "https://polylane.com"
  # Scoped npm tarball URL. Note the tarball filename after `/-/` uses the
  # unscoped basename (polylane), not the full scoped name.
  url "https://registry.npmjs.org/@coreplane/polylane/-/polylane-0.2.19.tgz"
  sha256 "6c93140668e1988d5c42668396f28c32ba1e0c85e07241b3a2878b55da64aef5"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "polylane", shell_output("#{bin}/polylane --version")
    assert_match "Resources:", shell_output("#{bin}/polylane --help")
  end
end
