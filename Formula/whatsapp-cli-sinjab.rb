class WhatsappCliSinjab < Formula
  desc "WhatsApp from your terminal (sinjab fork: canonical, actively maintained)"
  homepage "https://github.com/sinjab/whatsapp-cli"
  url "https://github.com/sinjab/whatsapp-cli/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "48d9f70c03059e3c2f970622876c7ea9f57fcb338a6c5287ecb1acc5f0a0f7f8"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-tags", "sqlite_fts5", "-trimpath", "-ldflags", "-s -w", "-o", "whatsapp", "./cmd/whatsapp"
    bin.install "whatsapp"
  end

  test do
    assert_match "1.1.1", shell_output("#{bin}/whatsapp --version")
  end
end
