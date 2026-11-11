class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.52.00"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.00/gam-7.52.00-macos27.0-arm64.tar.xz"
      sha256 "90e763dc7067840563cd9949ea87a808de9c70bfc23847999e3f9e77c451425a"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.00/gam-7.52.00-macos26.6-x86_64.tar.xz"
      sha256 "f417be799e80ca07626c7d655aa580d39d40d53c5513bba48ae01e15b8c55898"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.00/gam-7.52.00-linux-arm64-legacy.tar.xz"
      sha256 "b018475516e563f852c0cc5fa2bbb19124f5bc4abc2a9f02cedf1c4116d97866"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.00/gam-7.52.00-linux-x86_64-legacy.tar.xz"
      sha256 "869bc8898b041e85d4076c9883ca68bacffacdf37b56c43e68df3389f5f17c3a"
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
