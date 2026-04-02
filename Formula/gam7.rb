class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.39.03"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.03/gam-7.39.03-macos26.3-arm64.tar.xz"
      sha256 "81eb743e4828d1bf3ea0f7618503f89dbeea4c5f9208ce9fa13e6fca4c3da9a6"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.03/gam-7.39.03-macos26.3-x86_64.tar.xz"
      sha256 "406bb7ee820139e9a06621deaf6cd3984fbe2b58d5c15b08bd333b2432db4b6c"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.03/gam-7.39.03-linux-arm64-legacy.tar.xz"
      sha256 "548a17b013ba34e627f3d0652f0b2bbce2e8e6b2024bbb621976301eb854fea3"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.03/gam-7.39.03-linux-x86_64-legacy.tar.xz"
      sha256 "a7901c7c63894b3e03865fd3706e6832fad34b92f09a5f828efb1afa6ca9d1e3"
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
