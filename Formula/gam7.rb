class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.35.00"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.35.00/gam-7.35.00-macos26.3-arm64.tar.xz"
      sha256 "35af8f7aa9ef9af113681ee20f7c12caad014f6952ad976f3328ab5fd0474250"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.35.00/gam-7.35.00-macos26.3-x86_64.tar.xz"
      sha256 "044267de9763a3083a2114e4088b757e117270376486710ebef9a2196844bd1c"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.35.00/gam-7.35.00-linux-arm64-legacy.tar.xz"
      sha256 "268da737d3b3d5733324cb7e8a9509c6eab8b082fdab4105d2a9b87eb1bfe1a4"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.35.00/gam-7.35.00-linux-x86_64-legacy.tar.xz"
      sha256 "cfb7eebc655eb5cec063a99b849702395fbd003eb6c74eec20b10c64765f71c4"
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
