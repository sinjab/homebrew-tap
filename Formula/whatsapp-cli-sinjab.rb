class WhatsappCliSinjab < Formula
  desc "WhatsApp from your terminal (sinjab fork: canonical, actively maintained)"
  homepage "https://github.com/sinjab/whatsapp-cli"
  url "https://github.com/sinjab/whatsapp-cli/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "c1d6e89a68dff32f80f0c5f8eb8168a84e8b2e5c3f50e62f6bed9798262ea1b2"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-tags", "sqlite_fts5", "-trimpath", "-ldflags", "-s -w", "-o", "whatsapp", "./cmd/whatsapp"
    bin.install "whatsapp"
  end

  test do
    assert_match "1.2.0", shell_output("#{bin}/whatsapp --version")
  end
end
