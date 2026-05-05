class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.43.03"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.03/gam-7.43.03-macos26.3-arm64.tar.xz"
      sha256 "167221331235d151daf69fd95f8905aa4438fb4050efc3fa271eae36d24f64f3"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.03/gam-7.43.03-macos26.3-x86_64.tar.xz"
      sha256 "11834185e162f9fda8defd92e3eaf885313a643855b8e6b5f427cee30fd46958"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.03/gam-7.43.03-linux-arm64-legacy.tar.xz"
      sha256 "23d0181bff5595547da4c1af98c9e4287eb3da960d70c402fd4cb4626d2bac43"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.03/gam-7.43.03-linux-x86_64-legacy.tar.xz"
      sha256 "b539824f2839d5f6f6cf25d2bdf13fe94784e906a7522c8675774a50f814c9f9"
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
