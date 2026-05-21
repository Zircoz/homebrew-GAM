class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.43.08"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.08/gam-7.43.08-macos26.3-arm64.tar.xz"
      sha256 "d2c72117cf7df36c894e96a2aeb7b4c71f2d6be2d929437525c970e456abd4e3"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.08/gam-7.43.08-macos26.3-x86_64.tar.xz"
      sha256 "9e30c37b2537d73f6a4c4303a8415fdc22676114fda196ebe9b18fa7b6217078"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.08/gam-7.43.08-linux-arm64-legacy.tar.xz"
      sha256 "565bb99c18a4e86740a5e09a5a56fb76042c7c9a4c31347b89a0ec365b092614"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.08/gam-7.43.08-linux-x86_64-legacy.tar.xz"
      sha256 "a411050aea057f3762d2e48c025dae9e786fca5b7e87e4cc9541498c09abd4f4"
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
