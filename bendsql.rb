class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.com"
  url "https://github.com/databendlabs/bendsql/archive/refs/tags/v0.34.2.tar.gz"
  sha256 "f2128ed1cc8049baf2b54abdcdc8cc507240e17555bf1597e986be172d3d04d9"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/databendcloud/homebrew-tap/releases/download/bendsql-0.34.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "dcf71ab912dfffb4f993b212f04094f410ca0f13befaa2199513d4b493d40573"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2a8fa44f9ebf3c965a07f75de000d6e7cf381c2952e6cce56e6ded1505f5b710"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "323828b5aaf6c6df58dcd43e45fa0c40cd8a6b2cf54f0e8203d99a20ac4e5355"
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
    assert_match "bendsql 0.34.2-homebrew\n", output
  end
end
