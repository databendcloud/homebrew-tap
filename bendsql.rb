class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/databend-client/archive/v0.7.0.tar.gz"
  sha256 "6b4061ec0c86bc43a1262260e2cc352be7cd25b3c06ba064d4466bbf2791cd6a"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/databendcloud/homebrew-tap/releases/download/bendsql-0.7.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "8cca46c99673cf26cdf23a3e68fc49d8e83465718390527436ce5e813ca5fe53"
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
    assert_match "bendsql 0.7.0-homebrew\n", output
  end
end
