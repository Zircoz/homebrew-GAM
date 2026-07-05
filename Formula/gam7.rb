class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.46.07"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.07/gam-7.46.07-macos26.4-arm64.tar.xz"
      sha256 "5c9ba22c0659e64027f023ac4b347d323fba58482cd60fb6a6c9fc4fbfd736ac"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.07/gam-7.46.07-macos26.4-x86_64.tar.xz"
      sha256 "46b57eedc8e7fcfca016b865b8c7bbf436a93fc2e2992a2447b373daeb37d011"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.07/gam-7.46.07-linux-arm64-legacy.tar.xz"
      sha256 "9d78f8ea7bc037ebdf995d29d00158171ad26650b4fe6d44613806ecf7cb203f"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.07/gam-7.46.07-linux-x86_64-legacy.tar.xz"
      sha256 "8f711ddee71fc8848c00ab4a22adb950725f0c843695feb3f2c30bbc080a067d"
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
