class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.40.03"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.40.03/gam-7.40.03-macos26.3-arm64.tar.xz"
      sha256 "3bbebb983e8dc9b0a88023e32a538c4b88e48457b01a796f43a88a8e0052f5ed"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.40.03/gam-7.40.03-macos26.3-x86_64.tar.xz"
      sha256 "986cb306517c59b4c506302ee0d78603883a83d7a21890ad65cc8ad2787bd698"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.40.03/gam-7.40.03-linux-arm64-legacy.tar.xz"
      sha256 "0663c1aa2a5a61db2ceeb85ad2473a5bffbf435d24891682155fcbed6b8462fc"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.40.03/gam-7.40.03-linux-x86_64-legacy.tar.xz"
      sha256 "c59b9569947707f87b2beeaa4f9e2ba4d374722ab56922d6717813700e5491c1"
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
