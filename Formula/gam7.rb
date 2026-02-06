class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.33.01"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.33.01/gam-7.33.01-macos26.2-arm64.tar.xz"
      sha256 "d58b3497a393addb2837d13d56373a7c40bd89370013816010c43df2de8c31bc"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.33.01/gam-7.33.01-macos15.7-x86_64.tar.xz"
      sha256 "7ff054aa4d9f635b3add6470b5e2c7591daf6ab5dfe8c4173d99665ea30f67e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.33.01/gam-7.33.01-linux-arm64-legacy.tar.xz"
      sha256 "5802de29a3ce2fd05e17aa14f30e47edfbf748b7b0544433e2afd86c2b2a6cd4"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.33.01/gam-7.33.01-linux-x86_64-legacy.tar.xz"
      sha256 "ddc9a21996a96fac588336b43dfa47c510ffbce89f8a95d82f1bc84a27a28b48"
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
