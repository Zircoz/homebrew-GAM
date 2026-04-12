class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.40.02"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.40.02/gam-7.40.02-macos26.3-arm64.tar.xz"
      sha256 "a1fac2ffeae764e611ca8b4fb8a2bdce4784f36d4e55b855e3f9cbffd0040ac6"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.40.02/gam-7.40.02-macos26.3-x86_64.tar.xz"
      sha256 "f8f89227f4b3556bf40dbdf11c42c16724f0dd0036e8722f0e0eb45e9939c4af"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.40.02/gam-7.40.02-linux-arm64-legacy.tar.xz"
      sha256 "851b2fc1516e31b31daacf5fc07c32f9f1b2d6405ec9d051b7c631447222fb4d"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.40.02/gam-7.40.02-linux-x86_64-legacy.tar.xz"
      sha256 "8e8ce6ad2c2c2e419f0f699d70f61dced95a8f2712cda058c7d8dc1a6befa8e0"
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
