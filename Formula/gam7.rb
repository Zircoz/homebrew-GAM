class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.47.02"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.02/gam-7.47.02-macos26.5-arm64.tar.xz"
      sha256 "9313e0a66a0a54bafd2c1b0b76298c7e546271c088c50157ca8b1fedc5fb1d4f"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.02/gam-7.47.02-macos26.4-x86_64.tar.xz"
      sha256 "c49e91fdf801c320f916b76f517554167c073bb83a1ab9cbfd6721bd283935b2"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.02/gam-7.47.02-linux-arm64-legacy.tar.xz"
      sha256 "df52346716b04d567758453dcfbd53477255416df6c63b4252a7e37957946833"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.02/gam-7.47.02-linux-x86_64-legacy.tar.xz"
      sha256 "dda5f125c5f3770df0c83fc5aa2178cc1aceebeeda7ca1d15657f6f58ea77159"
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
