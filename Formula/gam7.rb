class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.39.06"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.06/gam-7.39.06-macos26.3-arm64.tar.xz"
      sha256 "4a67ec8443d065d884e7c2ab428c4098de6018aa7f0cb383514523d9cdbdbe78"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.06/gam-7.39.06-macos26.3-x86_64.tar.xz"
      sha256 "1136e3aeeef05dd92efb31b732b6e1d15a9bfd190058f654c6052320f022abbf"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.06/gam-7.39.06-linux-arm64-legacy.tar.xz"
      sha256 "21c367ec7df8946080f97dffd420f18e0012f8d4bf2e1d4fa5e09997dfe6160c"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.06/gam-7.39.06-linux-x86_64-legacy.tar.xz"
      sha256 "180dd661970aeac2fb04af20c59ebca22464348144d4c4e30d819cb0076ae617"
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
