class Pont < Formula
  desc "WhatsApp from your terminal (born from whatsapp-cli, MIT, (c) Edd Mann)"
  homepage "https://github.com/sinjab/pont"
  url "https://github.com/sinjab/pont/archive/refs/tags/v2.5.0.tar.gz"
  sha256 "6db57a41d368ebbb280aea1541e9aefca42e8578f9fa7f660b4b0325125e8f3d"
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
