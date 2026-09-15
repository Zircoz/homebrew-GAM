class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.48.08"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.08/gam-7.48.08-macos26.6-arm64.tar.xz"
      sha256 "b9fe7bf84f7dbd87919c68329ae6d659f8e653a72741fc9160ef9140ce836c57"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.08/gam-7.48.08-macos26.6-x86_64.tar.xz"
      sha256 "57b93be39fa4813e24fecf3247d51893e663863015e3f72be04ba04ddfdc8230"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.08/gam-7.48.08-linux-arm64-legacy.tar.xz"
      sha256 "ea05b42369add65fe648b3e5ea6a51dcfde3e712644d1efdcb1577411c4c40b4"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.48.08/gam-7.48.08-linux-x86_64-legacy.tar.xz"
      sha256 "ccd505c3064bd8ecb73403094c24566bef518006b32cdad602be17589cc4cc89"
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
