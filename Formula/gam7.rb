class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.01"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.01/gam-7.48.01-macos26.5-arm64.tar.xz"
      sha256 "6be4ab9327543ed3478ac23523a0311d59f60693ec58159b33edfd9faebad2fc"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.01/gam-7.48.01-macos26.6-x86_64.tar.xz"
      sha256 "c26122e41975988883dab5810cdb7133196737b6dcda3895bc18bfa722ff2450"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.01/gam-7.48.01-linux-arm64-legacy.tar.xz"
      sha256 "313ba33e80f9c695d8ab511bf62019816dee272f4f3d87d478bf42b313f84729"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.01/gam-7.48.01-linux-x86_64-legacy.tar.xz"
      sha256 "16f1c9f6dcf35f033c1438b12497ce6b5e57eae4359dcd1037c4cee4a5912b36"
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
