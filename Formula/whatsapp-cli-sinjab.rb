class WhatsappCliSinjab < Formula
  desc "WhatsApp from your terminal (sinjab fork: canonical, actively maintained)"
  homepage "https://github.com/sinjab/whatsapp-cli"
  url "https://github.com/sinjab/whatsapp-cli/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "a9fd7227d24ec543eb9a11bc5ea3bd3521cdcc71bd1eba8c546923eed05460ff"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-tags", "sqlite_fts5", "-trimpath", "-ldflags", "-s -w", "-o", "whatsapp", "./cmd/whatsapp"
    bin.install "whatsapp"
  end

  test do
    assert_match "1.4.0", shell_output("#{bin}/whatsapp --version")
  end
end
