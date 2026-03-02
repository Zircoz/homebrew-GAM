class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.34.12"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.12/gam-7.34.12-macos26.3-arm64.tar.xz"
      sha256 "ce6de2039c151b79f7b2130d9068ef1a9dfa1ed86d3aa76c10d84d89a68b00c9"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.12/gam-7.34.12-macos26.3-x86_64.tar.xz"
      sha256 "91a95c496318aa989f9cf1801270e4013cca5bad7c057ab08bb60e076e7041cb"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.12/gam-7.34.12-linux-arm64-legacy.tar.xz"
      sha256 "c257d1cba1cc647a047d31fe6fb61cc56bbcb172fbcd65c74ff754ed2a5ffe78"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.34.12/gam-7.34.12-linux-x86_64-legacy.tar.xz"
      sha256 "7c0830c618f74eb3a1fad64e2f4a98bc284bd982579e0f4e9723ee7f046d0a1f"
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
