class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.43.04"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.04/gam-7.43.04-macos26.3-arm64.tar.xz"
      sha256 "9d7605956da7b726723306f89cc5965a16e4270d5db4140b64dc9b86c907070a"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.04/gam-7.43.04-macos26.3-x86_64.tar.xz"
      sha256 "13fa6bb101fbeddac4a92b21a936022b03063c187b1114e8c31fe2d4cd8db1d1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.04/gam-7.43.04-linux-arm64-legacy.tar.xz"
      sha256 "628239dc0969331b048c1a35b34647d50684422481f61c3f6e0d9b606e544ac8"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.04/gam-7.43.04-linux-x86_64-legacy.tar.xz"
      sha256 "71485b5cb621fe228778cebb3a58a536a4843ccc5513c487d920640b7c868b43"
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
