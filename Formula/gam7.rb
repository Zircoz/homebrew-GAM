class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.44.01"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.44.01/gam-7.44.01-macos26.4-arm64.tar.xz"
      sha256 "730d0a23a9cf527a57877354fc9991b2cf0516183dbbaa7eb32ad024b505cf5e"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.44.01/gam-7.44.01-macos26.4-x86_64.tar.xz"
      sha256 "6818fc3243d7c7226c94c15b9ef42c7f55fbfe144d007afbf7cc52b7326d057e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.44.01/gam-7.44.01-linux-arm64-legacy.tar.xz"
      sha256 "e18c77bdd2a78fc1adf886523ebf338e973ff6ea3426ed53be5f756a5bd934fd"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.44.01/gam-7.44.01-linux-x86_64-legacy.tar.xz"
      sha256 "eb57da91baabb07f0a68a177376856fdd4e2e7dacaa0297274c0bee71186c283"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"gam"
  end

  test do
    system bin/"gam", "version"
  end
end
