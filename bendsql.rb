class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.com"
  url "https://github.com/databendlabs/bendsql/archive/refs/tags/v0.34.1.tar.gz"
  sha256 "42deae178c2ca99c79b29ef05c6b114bb68ad2568c9bf880bc7193be960d8f9e"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/databendcloud/homebrew-tap/releases/download/bendsql-0.34.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "494a72e1a1ed311c053e8b2936f2757c9b7943a1671f2723336ad6dc44998cb2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c7828b5e558d5bfaf41225d3fbc8f3eede152ba2f95f9385c809ec80c1d9ebeb"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "4d922de7a92e5ca5387a4be7933e0785e7e9d2b033f96e9c930d297810c39e76"
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
    assert_match "bendsql 0.34.1-homebrew\n", output
  end
end
