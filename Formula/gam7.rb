class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.49.03"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.49.03/gam-7.49.03-macos26.6-arm64.tar.xz"
      sha256 "31b7735dd2751ce69ee7d9841b33758698daec905759724f45f7b28579c1c584"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.49.03/gam-7.49.03-macos26.6-x86_64.tar.xz"
      sha256 "5851619869722c97ab8841b4e385135ad1407f9a0efc92c05f159f711fa49cc8"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.49.03/gam-7.49.03-linux-arm64-legacy.tar.xz"
      sha256 "1fa44a605dad72e5f5fa03f5e9ca94f7f9948c9b2531b2ac59f8320803acc152"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.49.03/gam-7.49.03-linux-x86_64-legacy.tar.xz"
      sha256 "25c0c1c4c68749dc310aa2a830ae27b537d887191f24fd5fcff41163a7797105"
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
