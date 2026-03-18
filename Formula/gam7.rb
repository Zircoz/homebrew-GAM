class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.36.02"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.36.02/gam-7.36.02-macos26.3-arm64.tar.xz"
      sha256 "aed8eb018cc574beedc68236d6754ea97df9399820c0b9339422e4b8fca5f836"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.36.02/gam-7.36.02-macos26.3-x86_64.tar.xz"
      sha256 "95ab58008160cde27032d778e99b770dc73849bc9e02e84f1ef787aa31e88e92"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.36.02/gam-7.36.02-linux-arm64-legacy.tar.xz"
      sha256 "d1f6e96f1bb44c8f1910e33e553c66a9751aead8e6ea73bba3a2822da5f832eb"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.36.02/gam-7.36.02-linux-x86_64-legacy.tar.xz"
      sha256 "5c8bd36956ff2a9a4cc36969e44f6bb6c311715d5a725a3680cc1933ad3823e4"
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
