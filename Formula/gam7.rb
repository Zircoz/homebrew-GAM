class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.35.02"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.35.02/gam-7.35.02-macos26.3-arm64.tar.xz"
      sha256 "6993c8aac032a24c609241561ccca8ed8a228ef033efc2f0130aab2807ca08ce"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.35.02/gam-7.35.02-macos26.3-x86_64.tar.xz"
      sha256 "9e86a249ac9a9fbb3650291372725e49033773cc9dacb519dc80995b90bc96b2"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.35.02/gam-7.35.02-linux-arm64-legacy.tar.xz"
      sha256 "84e001a2a191f2c17eba79b0d99fb38d75f0a99489a4564c660e8b7208a530f8"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.35.02/gam-7.35.02-linux-x86_64-legacy.tar.xz"
      sha256 "59ea768b6855cf18b517d77a869567ba9bf694dbff732ebae7cda9a0a76cdbac"
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
