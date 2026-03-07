class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.35.01"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.35.01/gam-7.35.01-macos26.3-arm64.tar.xz"
      sha256 "4d61982f0a49fccaea05d9283649afda726048085b91468e6dc68d23a9b1bc47"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.35.01/gam-7.35.01-macos26.3-x86_64.tar.xz"
      sha256 "67f6e285f7e67b186b47e64f2d97c8a375ca6513f1cf1433d4886719c6a1af02"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.35.01/gam-7.35.01-linux-arm64-legacy.tar.xz"
      sha256 "55af67ed9c544fce3e9ef876086d106c9d44256b3f4344cc77b9e1de0ca02e13"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.35.01/gam-7.35.01-linux-x86_64-legacy.tar.xz"
      sha256 "fcf59475ba2295d6b19eee30e4e47707e6d3ddec05f4cae0d39d0c75c82784ef"
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
