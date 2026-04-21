class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.41.01"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.41.01/gam-7.41.01-macos26.3-arm64.tar.xz"
      sha256 "63b618a9ad38460a0acdebcc776d42dea1e7818735d198731293071d36ed2587"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.41.01/gam-7.41.01-macos26.3-x86_64.tar.xz"
      sha256 "94865cdf4cbc5f6482c868fd77cb72004ee055da7c7e4bf0cbd11881e4f40daa"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.41.01/gam-7.41.01-linux-arm64-legacy.tar.xz"
      sha256 "36b958fe32c367cdf86ccfd0e1aaa4340c04ca94714c54212871f64122350fb1"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.41.01/gam-7.41.01-linux-x86_64-legacy.tar.xz"
      sha256 "7006d25a659ee7209587d761a02116a72d03b5da40a74877914a76bf93e8aebb"
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
