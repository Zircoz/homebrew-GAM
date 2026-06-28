class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.46.03"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.03/gam-7.46.03-macos26.4-arm64.tar.xz"
      sha256 "0d572a283aacd41e1281c47be35bb5b718241d21a9a418d605ea786cb7654f05"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.03/gam-7.46.03-macos26.4-x86_64.tar.xz"
      sha256 "160953385a7f101dc1f9c4e08dd499d1be24a50db988246e6fefbf2204684eb3"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.03/gam-7.46.03-linux-arm64-legacy.tar.xz"
      sha256 "832f8315fda22e32ddde23aa0bb8b67ac491b7057040d50e5633d2fafb7f2aec"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.03/gam-7.46.03-linux-x86_64-legacy.tar.xz"
      sha256 "467ee28517abca7c901da448e81ae90c2883eb5765b90c60c89c3b4a50b4ae9f"
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
