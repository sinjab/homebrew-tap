class Pont < Formula
  desc "WhatsApp from your terminal (born from whatsapp-cli, MIT, (c) Edd Mann)"
  homepage "https://github.com/sinjab/pont"
  url "https://github.com/sinjab/pont/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "1036333cee447fe3373abb50ede84e59f91cacd79416edea9e6c5a3aae533252"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-tags", "sqlite_fts5", "-trimpath", "-ldflags", "-s -w", "-o", "pont", "./cmd/pont"
    bin.install "pont"
    bin.install_symlink "pont" => "whatsapp"
  end

  test do
    assert_match "pont", shell_output("#{bin}/pont --version")
  end
end
