class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.36.01"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.36.01/gam-7.36.01-macos26.3-arm64.tar.xz"
      sha256 "95927aa1aec9ee1629ebc18e8f60f94dbb24980e37c01d831be5aa82a4685285"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.36.01/gam-7.36.01-macos26.3-x86_64.tar.xz"
      sha256 "2509fee98a6e4b9cb73fe7809139b636e1cf531c9ce606eeb67792c1aa65870f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.36.01/gam-7.36.01-linux-arm64-legacy.tar.xz"
      sha256 "29f5c4e94d477dd058546521df32038062388de22e742f163dfa3c30762e37b8"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.36.01/gam-7.36.01-linux-x86_64-legacy.tar.xz"
      sha256 "b1caed5a1e8775913521d7a0a31eaf3451bb0f4bc6e449c8bcaaa47c73b16534"
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
