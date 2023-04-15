class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/databend-client/archive/v0.2.6.tar.gz"
  sha256 "83ac732f7b4d75751a2f52f02d3acc4fb50e4dea13ae1be40fa41239e9c7d50b"
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
    assert_match "bendsql 0.2.5\n", output
  end
end
