class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.43.02"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.02/gam-7.43.02-macos26.3-arm64.tar.xz"
      sha256 "f76ed6a4e8bf84b6b5528867f4669a8640599f18e6f2800f0998fd76fe237aa5"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.02/gam-7.43.02-macos26.3-x86_64.tar.xz"
      sha256 "47cf193a79c6dcc30e232afcbd7094e6b5a82a1ccfb4934ebe7a8aa2deae5104"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.02/gam-7.43.02-linux-arm64-legacy.tar.xz"
      sha256 "5cb3e6c6e7c841146e0c768b707c6655a1d007d8c0888a766b2bc58a2b02a53c"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.02/gam-7.43.02-linux-x86_64-legacy.tar.xz"
      sha256 "ef4816110b957845213aaacb7c16ec14c75ad50df6eaee68031bc038a2a22dee"
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
