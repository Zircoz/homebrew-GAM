class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.25"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.25/gam-7.48.25-macos26.6-arm64.tar.xz"
      sha256 "95ef4c42ab8883066dd3a5fd992c38041b3585f58d59bbb13c2c95a287c1bb2e"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.25/gam-7.48.25-macos26.6-x86_64.tar.xz"
      sha256 "bbd85f7b7c592377615687b7c68ce10435982ac8c738582bf7e51543f5c729c4"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.25/gam-7.48.25-linux-arm64-legacy.tar.xz"
      sha256 "40bdeab2341196582937d79916c77f296fa9af6f52096ed665cf10046f603dd2"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.25/gam-7.48.25-linux-x86_64-legacy.tar.xz"
      sha256 "539eb156c0885349c10f3c9e4a45e7eae55d13ef02b9be55f95b34464fce8cb7"
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
