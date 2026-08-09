class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.47.03"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.03/gam-7.47.03-macos26.5-arm64.tar.xz"
      sha256 "fa3bdfc495571cf5bf4771e6f69d72be2c5c91e883de934f0e4f9706f6241992"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.03/gam-7.47.03-macos26.6-x86_64.tar.xz"
      sha256 "d71d3345bb26dbf1d845d199e2fb76afc61667560ccb8ddd52853772f10a94cf"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.03/gam-7.47.03-linux-arm64-legacy.tar.xz"
      sha256 "f3b6736a79530337708a282847d2d98b622029fe22dca76f76212e502f93c13c"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.03/gam-7.47.03-linux-x86_64-legacy.tar.xz"
      sha256 "a9070a3030477883a3ee5184b820446576e04e2192b3af8f234ce053f1a69429"
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
