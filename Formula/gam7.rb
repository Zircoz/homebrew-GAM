class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.52.03"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.03/gam-7.52.03-macos27.0-arm64.tar.xz"
      sha256 "09ca90c02e4069fd09e9e1ba8e8998e24577baedab15535e86b6697ad4532561"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.03/gam-7.52.03-macos26.6-x86_64.tar.xz"
      sha256 "ffb3ff90b17c1dd68223171b232f1739ef4b02d32961718b118fe2841e036aab"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.03/gam-7.52.03-linux-arm64-legacy.tar.xz"
      sha256 "f4a704e23e24b4e9f704ddcb2ae532c4b9a4065e7998556fc305ac3cfc3fe82e"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.03/gam-7.52.03-linux-x86_64-legacy.tar.xz"
      sha256 "46927a6cd60a1e9632b848a934ba07d03a98087893f50e84a6d73929fd16d576"
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
