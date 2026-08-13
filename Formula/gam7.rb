class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.47.06"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.06/gam-7.47.06-macos26.5-arm64.tar.xz"
      sha256 "ea192b80f9926fc5798d452e3d717699b515278c3b382bae584ef80dea660bfa"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.06/gam-7.47.06-macos26.6-x86_64.tar.xz"
      sha256 "84600fcc48332b50e2ec970cae1f438d9ae77c8a3a16c79a52f53579ecb376d1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.06/gam-7.47.06-linux-arm64-legacy.tar.xz"
      sha256 "1aeb950d3e0bac7288537b6d78a563a841b6bd06b4ecbd42552562d22ef82dc0"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.47.06/gam-7.47.06-linux-x86_64-legacy.tar.xz"
      sha256 "73cfb36be80f75da4cc975807e2112ec6bb0df93ade9989e49200f84ffb478f5"
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
