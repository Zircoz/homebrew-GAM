class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.22"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.22/gam-7.48.22-macos26.6-arm64.tar.xz"
      sha256 "c4b320217cd08e94b37041888c8c9272d4f89870d97dfffd779a498aa6473ec8"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.22/gam-7.48.22-macos26.6-x86_64.tar.xz"
      sha256 "2e56b925eb070ccdaa947ac2855a628f79506a01ca958e6998d7c1ca2c0312ea"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.22/gam-7.48.22-linux-arm64-legacy.tar.xz"
      sha256 "a11f5266beb572f040982b363437d3fedff462750fe37b5e6bda6a127998e28b"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.22/gam-7.48.22-linux-x86_64-legacy.tar.xz"
      sha256 "7609cf234a000b9cd64b2f329f6a68bd5b3fab0df4f709a2c6093ca2793fd3b7"
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
