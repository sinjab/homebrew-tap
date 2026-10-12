class Pont < Formula
  desc "WhatsApp from your terminal (born from whatsapp-cli, MIT, (c) Edd Mann)"
  homepage "https://github.com/sinjab/pont"
  url "https://github.com/sinjab/pont/archive/refs/tags/v2.3.1.tar.gz"
  sha256 "540811876dfcc66e1d9e6303629f84f0f26f92c785867540c17467bc3de37449"
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
