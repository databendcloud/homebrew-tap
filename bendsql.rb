class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/databend-client/archive/v0.3.7.tar.gz"
  sha256 "907c31f49a347d7928a27e0f09647bda1f94ebc1f94e3117c5333952b29df0f5"
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
