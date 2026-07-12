class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.46.09"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.09/gam-7.46.09-macos26.4-arm64.tar.xz"
      sha256 "45c203de7737092c8955289dee669456a3a2341a1c23db1cf331304702bc3bf0"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.09/gam-7.46.09-macos26.4-x86_64.tar.xz"
      sha256 "387b6e2b43b1fff4d57e5d59b08da848a706de4c1c827b7c653af638777366c2"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.09/gam-7.46.09-linux-arm64-legacy.tar.xz"
      sha256 "4fd4e8d7918f0a287b815c11b2f8409d3da3521908aba41e5b96bab2a0cd5790"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.09/gam-7.46.09-linux-x86_64-legacy.tar.xz"
      sha256 "6516923e874a123a5d47607cbbc9243048f231b98f6e0b41f624ac36894d3ada"
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
