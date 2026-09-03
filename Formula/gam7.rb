class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.04"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.04/gam-7.48.04-macos26.5-arm64.tar.xz"
      sha256 "8cb1c1ff19478306333b5e31277ddd93f926a90100ae6c16cd7f0d671c1dd1f5"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.04/gam-7.48.04-macos26.6-x86_64.tar.xz"
      sha256 "0465336fce0202f30ceeba7bb7212aa50b4861acbcabf8326bf018de1e508415"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.04/gam-7.48.04-linux-arm64-legacy.tar.xz"
      sha256 "9ac4b14fd2291692adbef1f0e6694ee324562e27ef3faa9957d89d1b3ce024ba"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.04/gam-7.48.04-linux-x86_64-legacy.tar.xz"
      sha256 "03b2cfa27f1e2de55c7f6584abac83b37bc023bb5ce099c818b1ac1c6b1312f2"
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
