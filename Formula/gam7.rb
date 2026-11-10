class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.51.00"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.51.00/gam-7.51.00-macos27.0-arm64.tar.xz"
      sha256 "e94d1831701523c846d1d2df9a3bb1ae05abf22f57eebd87f006846622f6246e"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.51.00/gam-7.51.00-macos26.6-x86_64.tar.xz"
      sha256 "67cddb7de07185c9d5cec81c23fd9e124be420f9785917d348d7ef9d6ef36bcc"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.51.00/gam-7.51.00-linux-arm64-legacy.tar.xz"
      sha256 "4079b957c0eea4d2fcd070a544ac89eee621346c9a2403df8b1e77058d83e832"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.51.00/gam-7.51.00-linux-x86_64-legacy.tar.xz"
      sha256 "0225b0b5f485dc872ae52ad1fe7fddb8ab2db3079d7e822219a2d43d8fc6d756"
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
