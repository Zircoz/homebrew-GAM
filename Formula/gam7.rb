class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.07"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.07/gam-7.48.07-macos26.6-arm64.tar.xz"
      sha256 "51f3f1bd0da4652bc473e1dd00b91766a196d1964deb3684f74c76590a10168a"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.07/gam-7.48.07-macos26.6-x86_64.tar.xz"
      sha256 "cc4700f617d7b346cab4ac72bea5eea5305a57a4aef3d4fd5156094b1ed57613"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.07/gam-7.48.07-linux-arm64-legacy.tar.xz"
      sha256 "e3a1b7c7cfd2a8b5ff0ba416b41d85f747b2dc8a8f4e0569be21602b955ba302"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.07/gam-7.48.07-linux-x86_64-legacy.tar.xz"
      sha256 "ea3b11a57a4fde5427d1eb8026e4308949f408a8bd5365a1a1fa08451724e3f9"
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
