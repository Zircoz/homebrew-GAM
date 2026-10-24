class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.34"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.34/gam-7.48.34-macos26.6-arm64.tar.xz"
      sha256 "3a88247bf1cea61fc275d407a171080089f80f39edec746416fa63e1d3937584"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.34/gam-7.48.34-macos26.6-x86_64.tar.xz"
      sha256 "34c4a438d3f08bcaa5bee4b19bbafca59169ffe522975260e09cc62c21d881dc"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.34/gam-7.48.34-linux-arm64-legacy.tar.xz"
      sha256 "e0f9322b85a2ae358ea703ef3644a46a4c8b1a99607d6aa6bed0df388526f963"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.34/gam-7.48.34-linux-x86_64-legacy.tar.xz"
      sha256 "968cf74094a0c65a20a95ce6211e2e50cc1edeb66fa59389b7222dfea1bb3c4e"
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
