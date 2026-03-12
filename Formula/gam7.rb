class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.36.00"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.36.00/gam-7.36.00-macos26.3-arm64.tar.xz"
      sha256 "4ecf89e259f8cb5a3953962ae8a639bdd71e266486f56d405503cbd9f9c08b06"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.36.00/gam-7.36.00-macos26.3-x86_64.tar.xz"
      sha256 "d4e0795abddde8376ed736ac5aa3be663568d202f15825bb4f63738bd6198549"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.36.00/gam-7.36.00-linux-arm64-legacy.tar.xz"
      sha256 "ec4fef48744c72825b448eef7c70ed19bb26272281af3282d612d901241bb348"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.36.00/gam-7.36.00-linux-x86_64-legacy.tar.xz"
      sha256 "0ac4ae0c8128f0f7209463dc0740b018ec675bb353694abdf4f0d7e661b82162"
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
