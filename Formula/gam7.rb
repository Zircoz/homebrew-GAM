class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.49.05"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.49.05/gam-7.49.05-macos26.6-arm64.tar.xz"
      sha256 "31201e5d3705aaec320bda0997bae99e0835a7747dfc7fc04999c7c8073e7ee8"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.49.05/gam-7.49.05-macos26.6-x86_64.tar.xz"
      sha256 "c7d32975c105680ac0177ae2dcef8c97838f9f74db34a734c6ed6461ad04ec70"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.49.05/gam-7.49.05-linux-arm64-legacy.tar.xz"
      sha256 "a6e0274a14a9461ddd86eb5ecdef1138450b8d319deae319e069d53f42d89250"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.49.05/gam-7.49.05-linux-x86_64-legacy.tar.xz"
      sha256 "27ceaa8da6b66314caacbb1e3a419e5f962a0a24edb8397c4c9c3057274b3007"
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
