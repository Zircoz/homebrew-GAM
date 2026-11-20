class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.52.05"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.05/gam-7.52.05-macos27.0-arm64.tar.xz"
      sha256 "54a3833e81446aad03e56f7d8e05c548e489a2e31cec78e90d3270986d4f5f4f"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.05/gam-7.52.05-macos26.6-x86_64.tar.xz"
      sha256 "a333a0b49d24830c9413e861de7853a09f2d19d0c5019641d11d5c0accbde962"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.05/gam-7.52.05-linux-arm64-legacy.tar.xz"
      sha256 "2499a9ee12691159e04526a9d042a5d2de3df437d6ab6edfb70eb2e9dcd5cdaf"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.52.05/gam-7.52.05-linux-x86_64-legacy.tar.xz"
      sha256 "89e3d3703056cdf756e79efd8e73fa1d020f69d95c3661d69c17bae77bd03320"
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
