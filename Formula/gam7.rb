class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.44.00"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.44.00/gam-7.44.00-macos26.4-arm64.tar.xz"
      sha256 "70fde9db6d5cfcf668d594f8475da7571851774cced76d149ca39ba5cba9c9e8"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.44.00/gam-7.44.00-macos26.4-x86_64.tar.xz"
      sha256 "90d4cd5998c492aa3fd89feeb0f9e65541995699a7660c20a7cb0aa1871c12b3"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.44.00/gam-7.44.00-linux-arm64-legacy.tar.xz"
      sha256 "71cf9a51ff4a1323193b91bb6a09792ccc2a06f9af0418c35c81389c9d730739"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.44.00/gam-7.44.00-linux-x86_64-legacy.tar.xz"
      sha256 "5cf5460b466e74b8f6e6ce58eae5cb9f590f5725ba70cdd99098561058d20bb0"
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
