class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.20"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.20/gam-7.48.20-macos26.6-arm64.tar.xz"
      sha256 "e7124b88ce1f62ef0885d97878b51a01baef2dd047c812755908f5187c6f639b"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.20/gam-7.48.20-macos26.6-x86_64.tar.xz"
      sha256 "05a86d06fcbd2c0a9e180df89b8a5c8f21b7de7a8fedbb273940858887182811"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.20/gam-7.48.20-linux-arm64-legacy.tar.xz"
      sha256 "fae3c386331c67a3392f920b83f8e266830ee43df818d7cfbc5d86a15f6c7f26"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.20/gam-7.48.20-linux-x86_64-legacy.tar.xz"
      sha256 "fdf797854abb340f19c85ba473ca3d75618faac97343d859dfedafcdfdaf984b"
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
