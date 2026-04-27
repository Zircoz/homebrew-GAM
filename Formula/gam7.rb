class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.41.03"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.41.03/gam-7.41.03-macos26.3-arm64.tar.xz"
      sha256 "35b46dcc4229ce3c57a317ef251dd5954ff35e1c7f707c9c29e484b5d85e2259"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.41.03/gam-7.41.03-macos26.3-x86_64.tar.xz"
      sha256 "800aeab3673b3ef21ec990ffa6143e824a933ab824cd79253bab8ce8de37cf67"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.41.03/gam-7.41.03-linux-arm64-legacy.tar.xz"
      sha256 "20aeff38eb413935d7f56a2cf98f90448a3c0b16dd7add4a736101742e1a8e10"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.41.03/gam-7.41.03-linux-x86_64-legacy.tar.xz"
      sha256 "4d43531537e89c99bf8a20730f1e64d87ec80d7b58fbaaa0fc14309c3aba12e9"
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
