class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.33"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.33/gam-7.48.33-macos26.6-arm64.tar.xz"
      sha256 "a44f65077bdc8ad104bf8feb5b2b6a19d2d55e531318fe403d94df1df747b121"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.33/gam-7.48.33-macos26.6-x86_64.tar.xz"
      sha256 "2ab7ef4cd29730cd0fc5f5f893a7d5cd76edc9663dd6181a86f5992d00f182d7"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.33/gam-7.48.33-linux-arm64-legacy.tar.xz"
      sha256 "95a6835f8c055944d9f2b9a6927eaddfdf661eeb00e99aea0a0c69d2804324dd"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.33/gam-7.48.33-linux-x86_64-legacy.tar.xz"
      sha256 "27fff4640d1d0c5043b9af2d2fbdc144c07306a18eb0a5b00b2d72372ece3949"
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
