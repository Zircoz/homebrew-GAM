class Gam < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.31.01"

  on_macos do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.01/gam-7.31.01-macos15.7-arm64.tar.xz"
      sha256 "5d6aa68b1f94b7a0e1cb63c06bda0d3abea5af623b588ab75bf67c1f71d8cba0"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.01/gam-7.31.01-macos15.7-x86_64.tar.xz"
      sha256 "b166a2a5337f4862bb0bb9e0a1e1fd430481b91f5299232b42113685009540d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.01/gam-7.31.01-linux-arm64-glibc2.35.tar.xz"
      sha256 "8113872b045186d9815edf5fc4a42a74a3a3db547655a0ea9e4f82399ab18cbe"
    end
    on_intel do
      url "https://github.com/GAM-team/GAM/releases/download/v7.31.01/gam-7.31.01-linux-x86_64-glibc2.35.tar.xz"
      sha256 "eaf517aa2486fbf4b4f1ab9ea2147cfb4d1f9aefb7aa83f93d8dc734f5021fe0"
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
