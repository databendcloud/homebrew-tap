class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/bendsql/archive/refs/tags/v0.17.0.tar.gz"
  sha256 "45499231b19626a03025b4780270a11662d45414415b53d8271d59f3d0a10b13"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/databendcloud/homebrew-tap/releases/download/bendsql-0.16.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "be4296b3fdc17c3825abcb1091a7a5be61bd294b63f8029645c2cfbb2af79338"
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
    assert_match "bendsql 0.17.0-homebrew\n", output
  end
end
