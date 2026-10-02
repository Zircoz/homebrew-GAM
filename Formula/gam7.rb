class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.16"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.16/gam-7.48.16-macos26.6-arm64.tar.xz"
      sha256 "a90cee6332c533a88d5ecf49aa60b6d9aadede1a09e8beb6ee329456802dae49"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.16/gam-7.48.16-macos26.6-x86_64.tar.xz"
      sha256 "f4d3916f6d9a1e6e2f00e6ba69d64a0e82399a0c41db39e2fc87e9517d4feb38"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.16/gam-7.48.16-linux-arm64-legacy.tar.xz"
      sha256 "6e50b7341d7dc40aac980cc1caddfaf731233cfec82e5adab39ee747e820eab2"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.16/gam-7.48.16-linux-x86_64-legacy.tar.xz"
      sha256 "0124212297d64ecac4435fb1b2dfac036d6d484b73acc980cb55164c74eea782"
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
