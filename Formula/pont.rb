class Pont < Formula
  desc "WhatsApp from your terminal (born from whatsapp-cli, MIT, (c) Edd Mann)"
  homepage "https://github.com/sinjab/pont"
  url "https://github.com/sinjab/pont/archive/refs/tags/v2.4.0.tar.gz"
  sha256 "00e344eb26de5257f528868cb41c932438e5480fa0ed65beb12be1aebe1e3481"
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
