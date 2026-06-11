class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.46.00"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.00/gam-7.46.00-macos26.4-arm64.tar.xz"
      sha256 "fc20e069a023bffb36bc34a2a3a8c95cd0667bac41249d80b38791d131bc13bd"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.00/gam-7.46.00-macos26.4-x86_64.tar.xz"
      sha256 "3fc20aa1de78a231ee024dec9d593070f40220e1e87a8a875c25044466a43dbb"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.00/gam-7.46.00-linux-arm64-legacy.tar.xz"
      sha256 "a21a3d3f9cd6d94bb743cf059a1aca6b759f25db201bcf6f347724136db5037c"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.00/gam-7.46.00-linux-x86_64-legacy.tar.xz"
      sha256 "1d32d1253a80294283d208af402f77920e9d9b228fbe3cf5fefa9aa7bf5b86f3"
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
