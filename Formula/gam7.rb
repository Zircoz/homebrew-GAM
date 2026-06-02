class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.44.03"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.44.03/gam-7.44.03-macos26.4-arm64.tar.xz"
      sha256 "04456a1c635bd50fdca117a71b47ce027bf341e5b0d7f27709895d835e8272bb"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.44.03/gam-7.44.03-macos26.4-x86_64.tar.xz"
      sha256 "3fb8c42aefe1cd417bf6eecc5b454eb5161c2e7ab86530c671f61fa69587a880"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.44.03/gam-7.44.03-linux-arm64-legacy.tar.xz"
      sha256 "f2238f0bf635cd788b9a7b36d621b8cf8af3566b1f5923c11d0355e540ec28b2"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.44.03/gam-7.44.03-linux-x86_64-legacy.tar.xz"
      sha256 "7d650d2b62957a9a6e51bb70cdf4865ed94440f4598260f3cadf299301f910f3"
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
