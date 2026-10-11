class Pont < Formula
  desc "WhatsApp from your terminal (born from whatsapp-cli, MIT, (c) Edd Mann)"
  homepage "https://github.com/sinjab/pont"
  url "https://github.com/sinjab/pont/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "31c67680c76027fcee3d5106f85a50b13bf1d8c4c126ece867e738cd98a37816"
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
