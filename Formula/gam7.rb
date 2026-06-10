class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.45.00"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.45.00/gam-7.45.00-macos26.4-arm64.tar.xz"
      sha256 "6126bc0d537654dc19c686c091c975f096e11b8417129de220868e71a5e146ad"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.45.00/gam-7.45.00-macos26.4-x86_64.tar.xz"
      sha256 "2cf4993c5494ef51ec31352001019f4a7d57b542b114ea79035f039df2050176"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.45.00/gam-7.45.00-linux-arm64-legacy.tar.xz"
      sha256 "726007699a10c0354c6d9a059ea5948ddec1388f21c3012325d523a0763454fd"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.45.00/gam-7.45.00-linux-x86_64-legacy.tar.xz"
      sha256 "52a89e17b2cf6aff16e93163d8e9b8ce112890f35b0abfc9965940d16b470d27"
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
