class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.46.04"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.04/gam-7.46.04-macos26.4-arm64.tar.xz"
      sha256 "494824bfe9fcbd6b36e6aa5736a8702fc786a56fdcfe32f4bcd8bc84812f7f55"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.04/gam-7.46.04-macos26.4-x86_64.tar.xz"
      sha256 "3defc5e4685fee4fd2cf4f98b86c7b7363352129d1d08a6ebc3992ddfac4d5e8"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.04/gam-7.46.04-linux-arm64-legacy.tar.xz"
      sha256 "43a0fa0da749e09a34d0169c2342de6cd52c94ef43f8c0af7c648b6b3cd5f75f"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.04/gam-7.46.04-linux-x86_64-legacy.tar.xz"
      sha256 "eb2a10802e620adf2977ffbc1f8e7561e2a915f89ff387b737002075709e8673"
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
