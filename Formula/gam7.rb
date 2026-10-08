class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.23"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.23/gam-7.48.23-macos26.6-arm64.tar.xz"
      sha256 "7964e41e6a7a3ee5889817d4ec69b4fd7351114380b6f79c2a8c1f1cf9b3ea47"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.23/gam-7.48.23-macos26.6-x86_64.tar.xz"
      sha256 "df29c6e1897948868f4ad763f20d61f088879a0b15f906cec744e6830a39e7d5"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.23/gam-7.48.23-linux-arm64-legacy.tar.xz"
      sha256 "76c2547640d95b3b57e6984b56ed9f31f6c7d96ba50a12c1024006252b0ca864"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.23/gam-7.48.23-linux-x86_64-legacy.tar.xz"
      sha256 "8d20a333887e90a84d148f917e002f74f784c830f196dcaf5cc62d104df7d2a0"
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
