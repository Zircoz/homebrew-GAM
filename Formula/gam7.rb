class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.36.03"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.36.03/gam-7.36.03-macos26.3-arm64.tar.xz"
      sha256 "72b04b819257749ebe06896a44b6fb8773637ee17b409591dac1b465f22af6bd"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.36.03/gam-7.36.03-macos26.3-x86_64.tar.xz"
      sha256 "d24ac715becd20dc601f1951dba626ba59b8550cb55a79f35f526b33859d67d3"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.36.03/gam-7.36.03-linux-arm64-legacy.tar.xz"
      sha256 "be8f884a3f89874461151bc98a5f5c79130540ba7d95ca3201aa661db33920b3"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.36.03/gam-7.36.03-linux-x86_64-legacy.tar.xz"
      sha256 "a45fdd47e6a25b2096b2a89a290262f7a6ec0de606268a4f739ab99d4b5f47a0"
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
