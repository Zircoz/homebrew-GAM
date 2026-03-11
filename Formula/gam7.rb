class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.35.03"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.35.03/gam-7.35.03-macos26.3-arm64.tar.xz"
      sha256 "3332496afd1f688f565ddb68cd28ead4e0480a5ed5f476f52ef61c21b8a12f8c"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.35.03/gam-7.35.03-macos26.3-x86_64.tar.xz"
      sha256 "cba03412ea8141232c429de3ff3ae64e8706f07d483b11402fdbd4d9117caad1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.35.03/gam-7.35.03-linux-arm64-legacy.tar.xz"
      sha256 "8dbf7fb5228ee75c6ede79b4477097a8401a3550034320c872bb1fa05d1f09d8"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.35.03/gam-7.35.03-linux-x86_64-legacy.tar.xz"
      sha256 "4b0a07ee7f50877dd93e281cacd08a03c00f480ee452ee2af401c90c7183d45a"
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
