class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/databend-client/archive/v0.6.5.tar.gz"
  sha256 "da43d6f554774886c1b8ffda3b0a55d46dc4ca9f6521e3124eb3eec10096b623"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/databendcloud/homebrew-tap/releases/download/bendsql-0.6.5"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "5f7af30e5db2ddf58530ef8bec5ad3220396ebc3e8218c282ede3a6378c63384"
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
    assert_match "bendsql 0.6.5-dev()\n", output
  end
end
