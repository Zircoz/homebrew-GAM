class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.47.00"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.00/gam-7.47.00-macos26.4-arm64.tar.xz"
      sha256 "3e026bd6917a982727c2f0903fcd822d31f070130d075ff01b55882aeca144b4"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.00/gam-7.47.00-macos26.4-x86_64.tar.xz"
      sha256 "425406fb498c7b587dc313b7f1f9cacfca1a88f35690902dfa8e16f6e22a9d12"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.00/gam-7.47.00-linux-arm64-legacy.tar.xz"
      sha256 "9441854cdd3de1f58315d56f0c1ae8eeaf6791b6c0f3110799aff1bafe479f98"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.00/gam-7.47.00-linux-x86_64-legacy.tar.xz"
      sha256 "7feebc42b3a50ea2191305bcfb44e62f05da0f551ab78e0af70e01c53064c6ee"
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
