class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.52.02"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.02/gam-7.52.02-macos27.0-arm64.tar.xz"
      sha256 "d11567d12ba8cda0350274ae3f98c0b7153fa0fcb5c895e04eb8e4ae2b46d31d"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.02/gam-7.52.02-macos26.6-x86_64.tar.xz"
      sha256 "7cc564bdce227fac67ad25cf69ec3f55a9b256489cf851e88d8170128a59e70d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.02/gam-7.52.02-linux-arm64-legacy.tar.xz"
      sha256 "b0244614288d602387943f6a16f27867ff854fe9f182c5999ee288d7b2d9edbe"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.02/gam-7.52.02-linux-x86_64-legacy.tar.xz"
      sha256 "eacf5a659863bfde03b770d7feebec436088dfd0e251708186f12872dc4de31f"
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
