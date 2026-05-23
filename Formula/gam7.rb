class Gam7 < Formula
  desc "Command line management for Google Workspace"
  homepage "https://github.com/GAM-team/GAM"
  version "7.43.10"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.10/gam-7.43.10-macos26.4-arm64.tar.xz"
      sha256 "81bba47564abb567c37b2eaca79a9ffb218a3ed80056114f4da4f9eed2f096c2"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.10/gam-7.43.10-macos26.4-x86_64.tar.xz"
      sha256 "5f160a673e3d2089828e94a65da8aae4de6c412bd8daa6fef2f10ff23661ef74"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.10/gam-7.43.10-linux-arm64-legacy.tar.xz"
      sha256 "dd9b959d61ebcd95a9b4bc60da8af6e2d7a4d23da263eaf39a4c34e8af7ff962"
    else
      url "https://github.com/GAM-team/GAM/releases/download/v7.43.10/gam-7.43.10-linux-x86_64-legacy.tar.xz"
      sha256 "81d9b10b7e90c9c8cb3883ab6ce7eb3b537a79fe76f5a4d288f865fcce210576"
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
