class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.33.03"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.33.03/gam-7.33.03-macos26.2-arm64.tar.xz"
      sha256 "aa6c79cdb1bbc9f50203865c025f9d80741c1a605f26051340b256e0bfd38e75"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.33.03/gam-7.33.03-macos15.7-x86_64.tar.xz"
      sha256 "a3741fafa59f71994b13a07b84a89661942dc819a8b4c53bbe8508e1dde0417e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.33.03/gam-7.33.03-linux-arm64-legacy.tar.xz"
      sha256 "23fdf1e65b5dfb53be2c7c49735644b48b4e5113fc3ef33588562e7aa38edcef"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.33.03/gam-7.33.03-linux-x86_64-legacy.tar.xz"
      sha256 "c9b9b5975166ec927b82adeb32108ccd61ff13865dddd43d27df958ba7ec7119"
    end
  end

  def install
    # The tarball extracts to a directory named 'gam7'.
    # Homebrew automatically cd's into that directory if it's the only one.
    # We install all files to libexec and link the binary.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"gam"
  end

  test do
    system bin/"gam", "version"
  end
end
