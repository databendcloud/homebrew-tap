class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/databend-client/archive/v0.3.0.tar.gz"
  sha256 "632ae1e76f52dc8401d401974feff155101a7559fb21901fd658df510b6e6c4e"
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
    assert_match "bendsql 0.2.6\n", output
  end
end
