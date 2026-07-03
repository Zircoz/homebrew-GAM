class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.46.06"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.06/gam-7.46.06-macos26.4-arm64.tar.xz"
      sha256 "880bca54f7849b41bc6bad2c7d1320a06f6ac88cfc897943373deca3b417d18b"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.06/gam-7.46.06-macos26.4-x86_64.tar.xz"
      sha256 "0a28f630c54353ae57be0aaf25b5d7ff3f3a51adfdf104a2152ed64981aeac15"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.06/gam-7.46.06-linux-arm64-legacy.tar.xz"
      sha256 "8844041c02bd0e60a1a7469c771d88689278651facf37a4ef723331feb1c306e"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.06/gam-7.46.06-linux-x86_64-legacy.tar.xz"
      sha256 "f66e032410958305b83adccc50efec25468095b6c4bfed0a079a91b2a11a7cf8"
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
