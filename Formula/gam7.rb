class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.39.02"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.02/gam-7.39.02-macos26.3-arm64.tar.xz"
      sha256 "fc29b6f3b4342eb45e221fc1e5b471563d69c09dbb00cc0babfae06639b81423"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.02/gam-7.39.02-macos26.3-x86_64.tar.xz"
      sha256 "2840a4a98df05c55efb3fc6a398207e3d94e340bd19fbc6169fbbcd28f1409d9"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.02/gam-7.39.02-linux-arm64-legacy.tar.xz"
      sha256 "1219e4063dd7fbfa37f161c88e3afe16bb1a9c0aff7fb49e98d0df6d8375664f"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.39.02/gam-7.39.02-linux-x86_64-legacy.tar.xz"
      sha256 "e12801b706fa58137320373ae6c77f92daf14d8c54b7b4681ac68439e66b696b"
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
