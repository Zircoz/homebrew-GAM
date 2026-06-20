class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.46.02"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.02/gam-7.46.02-macos26.4-arm64.tar.xz"
      sha256 "158cc4415a0ed59076f5e329a6856262061c07ed4911d4860d42d9d8e43edd94"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.02/gam-7.46.02-macos26.4-x86_64.tar.xz"
      sha256 "4d2b8a2f0748fff804e292fe081d06098f5708aa131404341d1a75a9e490915a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.02/gam-7.46.02-linux-arm64-legacy.tar.xz"
      sha256 "cd017501d816fe59f548303c770847f06bf5e668f4c5e5b6da846a0a904ab453"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.02/gam-7.46.02-linux-x86_64-legacy.tar.xz"
      sha256 "7100a96f56fbf3adbdd02c26815234c3d84228e950e729e92bf6e20bf93ffb88"
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
