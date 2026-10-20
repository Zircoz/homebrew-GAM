class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.31"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.31/gam-7.48.31-macos26.6-arm64.tar.xz"
      sha256 "28c383a2ef9bb7f2e2b64badf3bece760d79d908319e5a6849e12fac69529c7f"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.31/gam-7.48.31-macos26.6-x86_64.tar.xz"
      sha256 "993ea34c6324f2eea0f3688e191c8c2ef1bdc4e5489eddf5c08214ca5cfaea7d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.31/gam-7.48.31-linux-arm64-legacy.tar.xz"
      sha256 "fd089500c3b12aec8daea2bb91f76cffdcaf49fe3e1fbff7c3a25bf9a9b52152"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.31/gam-7.48.31-linux-x86_64-legacy.tar.xz"
      sha256 "aa0fe9912bb51957fabf6886ac9204c73f7f330c8d82c8a9f9c4e2f9f565c7a5"
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
