class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.12"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.12/gam-7.48.12-macos26.6-arm64.tar.xz"
      sha256 "70b8582f60bbd8f937c694d7c3472da37f893ee2ece0de8bf131a8e708ecd126"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.12/gam-7.48.12-macos26.6-x86_64.tar.xz"
      sha256 "23e2aa89f215559cc60088fca1e5661f7b7d07068b0931affff104ee67620a9e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.12/gam-7.48.12-linux-arm64-legacy.tar.xz"
      sha256 "bf35c26febc77742838e4b40d5742e8edf93521c8cf619d82c8ee64f889086b6"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.12/gam-7.48.12-linux-x86_64-legacy.tar.xz"
      sha256 "137270996fc9dc64fd15c052b80c8c02ab11b7bb523f3e6880bf29b0607aeb8e"
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
