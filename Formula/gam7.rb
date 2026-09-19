class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.10"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.10/gam-7.48.10-macos26.6-arm64.tar.xz"
      sha256 "ed35630ca9f03a59443d0600a08cd3d825fc06e4d641c0839a08f057e6b2e426"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.10/gam-7.48.10-macos26.6-x86_64.tar.xz"
      sha256 "f6b64160f4966eb312b40ed1b666bc5c312c84f507827ab93e222cd7f19f3ed4"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.10/gam-7.48.10-linux-arm64-legacy.tar.xz"
      sha256 "35358f04f7ef4ce5d365cd4f2735df7091bf150ba98de6110a4026235edf285a"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.10/gam-7.48.10-linux-x86_64-legacy.tar.xz"
      sha256 "5ea23b0d568ae2eeb0318d2f6078f61d6e928400fb7963c28b03e06c52f99e52"
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
