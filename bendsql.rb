class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/databend-client/archive/v0.6.6.tar.gz"
  sha256 "28572d3c47e433c800d9954ae0f639d8bdfc6f835033cb4728ce00eca7f352e0"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/databendcloud/homebrew-tap/releases/download/bendsql-0.6.5"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "5f7af30e5db2ddf58530ef8bec5ad3220396ebc3e8218c282ede3a6378c63384"
  end

  depends_on "rust" => :build

  def install
    ENV["BENDSQL_BUILD_INFO"] = "homebrew"
    build_root = buildpath/"cli"
    cd build_root do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    output = shell_output("#{bin}/bendsql -V")
    assert_match "bendsql 0.6.6-homebrew\n", output
  end
end
