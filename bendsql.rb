class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/databend-client/archive/v0.9.2.tar.gz"
  sha256 "aa69e81287d267a8960d04e4259c1a203c34b0e96378f18b4d8d239219576e97"
  license "Apache-2.0"

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
