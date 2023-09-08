class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/databend-client/archive/v0.6.3.tar.gz"
  sha256 "3230c2a6a500738d89364b3990665c634878bb2e34caf0c76c6ebd15139fa42b"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/databendcloud/homebrew-tap/releases/download/bendsql-0.6.3"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "77d3cfe7ca740c71e7b0af61fafe6e348df4b6cd37e3723c2754065f19e91d72"
  end

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
