class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/databend-client/archive/v0.6.3.tar.gz"
  sha256 "3230c2a6a500738d89364b3990665c634878bb2e34caf0c76c6ebd15139fa42b"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    build_root = buildpath/"cli"
    cd build_root do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    output = shell_output("#{bin}/bendsql -V")
    assert_match "bendsql 0.6.3-dev()\n", output
  end
end
