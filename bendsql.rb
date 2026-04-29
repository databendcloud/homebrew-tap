class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.com"
  url "https://github.com/databendlabs/bendsql/archive/refs/tags/v0.33.7.tar.gz"
  sha256 "8b1d3508f16f358801c9c31ab2d5f0856287a98b98e87f1db7a6fdc34b39d4a3"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/databendcloud/homebrew-tap/releases/download/bendsql-0.20.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "244ddc3c965c7e42197810363e3a7424b6e30bc589a49add36de0f2806fe1c96"
    sha256 cellar: :any_skip_relocation, ventura:      "cd2b219ae5fa322aed82d711ddc187a08e2bac230d75bdce5dc3e2a953aa3bd3"
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
    assert_match "bendsql 0.33.7-homebrew\n", output
  end
end
