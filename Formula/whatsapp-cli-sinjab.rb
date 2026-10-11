class WhatsappCliSinjab < Formula
  desc "WhatsApp from your terminal (sinjab fork: canonical, actively maintained)"
  homepage "https://github.com/sinjab/whatsapp-cli"
  url "https://github.com/sinjab/whatsapp-cli/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "bfb0367704bda218ff83bb8087ea80799c3d4158c59de1e9560e99f9b0770f15"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-tags", "sqlite_fts5", "-trimpath", "-ldflags", "-s -w", "-o", "whatsapp", "./cmd/whatsapp"
    bin.install "whatsapp"
  end

  test do
    assert_match "1.3.0", shell_output("#{bin}/whatsapp --version")
  end
end
