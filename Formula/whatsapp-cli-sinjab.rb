class WhatsappCliSinjab < Formula
  desc "WhatsApp from your terminal (sinjab fork: canonical, actively maintained)"
  homepage "https://github.com/sinjab/whatsapp-cli"
  url "https://github.com/sinjab/whatsapp-cli/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "86db98bb1829366cb3bb5d3c100e7ba4da6c8927f40d9367afd98d32af51460a"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-tags", "sqlite_fts5", "-trimpath", "-ldflags", "-s -w", "-o", "whatsapp", "./cmd/whatsapp"
    bin.install "whatsapp"
  end

  test do
    assert_match "1.1.0", shell_output("#{bin}/whatsapp --version")
  end
end
