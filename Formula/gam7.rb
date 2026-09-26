class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.14"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.14/gam-7.48.14-macos26.6-arm64.tar.xz"
      sha256 "ce1ae697ef130c5934948a7f3f0c232f00bc481317159217aba700fbe16188ee"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.14/gam-7.48.14-macos26.6-x86_64.tar.xz"
      sha256 "a69d4ee47a521936784d7297e6381b29dec5f1dabf8499114c47ff13edf9ec98"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.14/gam-7.48.14-linux-arm64-legacy.tar.xz"
      sha256 "e2a614e8af35230bf6a37578a5f89934d9480cbb502797914e49203b799505dd"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.14/gam-7.48.14-linux-x86_64-legacy.tar.xz"
      sha256 "a69286201b030757bf687e2cd70732293c55a99bf9168cadc0f33b3d2d58f30f"
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
