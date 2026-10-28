class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.49.02"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.49.02/gam-7.49.02-macos26.6-arm64.tar.xz"
      sha256 "5e881825707dcea9915a0dae70a7d16aad9b7911c18ce6c3cabf53f0cb99229c"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.49.02/gam-7.49.02-macos26.6-x86_64.tar.xz"
      sha256 "0f64db27e3c270740353a08840abf154b50953cd6ac02d10277b41f27d9101d4"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.49.02/gam-7.49.02-linux-arm64-legacy.tar.xz"
      sha256 "9a619d9b4ec82c0b1b52a30b8964591eaeda1d8a68ac4c7247f4376af1ea6819"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.49.02/gam-7.49.02-linux-x86_64-legacy.tar.xz"
      sha256 "6fcb757f22f7594f9a4ff5b4461e5f2e9c8cf8e80d0a47051a58fa333f3d8a81"
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
