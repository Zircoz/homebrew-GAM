class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.41.00"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.41.00/gam-7.41.00-macos26.3-arm64.tar.xz"
      sha256 "b21219ba4ffbafd3eccc9a1721f2b572219a3dd7974e4df4087cb3a1019ffdcd"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.41.00/gam-7.41.00-macos26.3-x86_64.tar.xz"
      sha256 "f0b36fa5068649b8d825c4ce640c54c728bee46c3dff4abec6d4a27e681d4156"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.41.00/gam-7.41.00-linux-arm64-legacy.tar.xz"
      sha256 "6c3951b1c2421f58a11359af93a8728c75171fb1afa5a2763f45cff21f291ca9"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.41.00/gam-7.41.00-linux-x86_64-legacy.tar.xz"
      sha256 "d139fc48b5c4cc14cea8b503a3efc04864c21b6e2a3b6a13f2eaf6493aea4c1f"
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
