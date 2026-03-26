class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.38.02"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.38.02/gam-7.38.02-macos26.3-arm64.tar.xz"
      sha256 "2c615b8f0b99a565e9ace7182bf542f4a90f50c2840dbce557116fa9ab7218ee"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.38.02/gam-7.38.02-macos26.3-x86_64.tar.xz"
      sha256 "ed04a26a5da9d20fbd04032d8e0a64326b0b10b500f49c73df85ebe70060e502"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.38.02/gam-7.38.02-linux-arm64-legacy.tar.xz"
      sha256 "5dca08026d8432a3fcc174d5ef8a248fb9a0c43e8ea5faf33ccc4b8dc7a221a0"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.38.02/gam-7.38.02-linux-x86_64-legacy.tar.xz"
      sha256 "8cd168454abe7ae439f48f540be2608a15a3e88d85531b053341b97a95794e6a"
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
