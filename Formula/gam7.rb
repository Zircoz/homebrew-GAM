class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.46.08"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.08/gam-7.46.08-macos26.4-arm64.tar.xz"
      sha256 "a2028787d85a0efa5d4560f198b9904b96233a2d04cd607fcf232a8c03299a34"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.08/gam-7.46.08-macos26.4-x86_64.tar.xz"
      sha256 "338b174694c4bb0eeb55fa29903341dfc5e2f4dbec0ae81fb9eebb2d11c4bdd8"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.08/gam-7.46.08-linux-arm64-legacy.tar.xz"
      sha256 "3afc780b15ede68a94a77e145587fad510f52d1923c23947dc262643ae1a9ecf"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.46.08/gam-7.46.08-linux-x86_64-legacy.tar.xz"
      sha256 "4d612af74a2b317308a9737174c0d27e275e0997ca0f01581e55c6c20765946f"
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
