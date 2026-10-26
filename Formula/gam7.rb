class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.49.00"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.49.00/gam-7.49.00-macos26.6-arm64.tar.xz"
      sha256 "53a3a7d7f17b6ee3252b2e5bc0e247792892f90939a2e8ca323b1078d4d3934a"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.49.00/gam-7.49.00-macos26.6-x86_64.tar.xz"
      sha256 "d11f46e5bb484be281ddd89fe3138bd6d5b1d527d4ac2395f5779a744ecd8634"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.49.00/gam-7.49.00-linux-arm64-legacy.tar.xz"
      sha256 "889a1ad7fe6702f4d719bac2cbf818e384e30c39c004dddb05da05254318195f"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.49.00/gam-7.49.00-linux-x86_64-legacy.tar.xz"
      sha256 "3750175f5bb241bed421c2c41a881c16fc3a4f34035c81e8c4d81da27ba8ad2a"
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
