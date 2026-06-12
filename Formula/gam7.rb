class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.46.01"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.01/gam-7.46.01-macos26.4-arm64.tar.xz"
      sha256 "e17d41275f3da012d4f3c960b09e5fa39df12a8903dc94648e8020e1aa3816d4"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.01/gam-7.46.01-macos26.4-x86_64.tar.xz"
      sha256 "ca0105d83b1926e48f9a3626b222d14f472e071726b3ce5c2e324fc57cc5ecbe"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.01/gam-7.46.01-linux-arm64-legacy.tar.xz"
      sha256 "92b05608577ac960ae64574ba88f4b2b69db33f7e309c5d6db7505e3411b8f0a"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.01/gam-7.46.01-linux-x86_64-legacy.tar.xz"
      sha256 "e19cd8da08b9d4f06d4d2815386488993e4e2f6b2ba559f5efc50c83aea42061"
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
