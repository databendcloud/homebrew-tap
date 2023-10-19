class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/databend-client/archive/v0.9.1.tar.gz"
  sha256 "aa345b62c6b9843ab026f91bad23261ee8454508c76a88222dd5b030e7954712"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/databendcloud/homebrew-tap/releases/download/bendsql-0.8.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f310624ddb057319ff60f5f48bec80665e02efed58ac9eed7b6a18698edd062e"
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
    assert_match "bendsql 0.9.1-homebrew\n", output
  end
end
