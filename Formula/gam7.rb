class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.24"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.24/gam-7.48.24-macos26.6-arm64.tar.xz"
      sha256 "c342b1bce931cecb55526b7efbea6dfe5bb1078733f8bc386db171d9e2dfa821"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.24/gam-7.48.24-macos26.6-x86_64.tar.xz"
      sha256 "991d6030ed6e3680589dcb9e151c01f9b67610e9f686ac8703d481adfbd6d97d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.24/gam-7.48.24-linux-arm64-legacy.tar.xz"
      sha256 "9494bce85c5a7b9536d921e1256aa9fa536c9ee1734bd72bb5f98e1ae2008a77"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.24/gam-7.48.24-linux-x86_64-legacy.tar.xz"
      sha256 "8fd52b826022b5a312955923ce7a90def2f29e49361163e2533a6481ca78a10b"
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
