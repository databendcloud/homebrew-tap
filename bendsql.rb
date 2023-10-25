class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/bendsql/archive/refs/tags/v0.9.2.tar.gz"
  sha256 "aa69e81287d267a8960d04e4259c1a203c34b0e96378f18b4d8d239219576e97"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/databendcloud/homebrew-tap/releases/download/bendsql-0.9.2"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "90a201171410a7530f091267867697d9865bd1e8e07b8790832afb0dc75339fa"
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
    assert_match "bendsql 0.9.2-homebrew\n", output
  end
end
