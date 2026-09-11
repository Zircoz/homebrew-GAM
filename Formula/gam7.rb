class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.06"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.06/gam-7.48.06-macos26.6-arm64.tar.xz"
      sha256 "c196743e720b62c8f3eabc9b9c0e39f6b8471239c0abc399c11a687bc7570d8d"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.06/gam-7.48.06-macos26.6-x86_64.tar.xz"
      sha256 "0e2f280c68e5b28511b2347007e8d0171987c6d8f904c5ec5c7746ca183f6e9e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.06/gam-7.48.06-linux-arm64-legacy.tar.xz"
      sha256 "02ec98e9a72bcc4382d00ae7d9a0c4a59ee972adca643cc93e3fab63e9e05bfb"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.06/gam-7.48.06-linux-x86_64-legacy.tar.xz"
      sha256 "bb6a040bb6f7d1b4ead1ed1ee90673e19a909bf677d2f700609ad0cfd1ce9393"
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
