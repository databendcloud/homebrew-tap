class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/bendsql/archive/refs/tags/v0.11.3.tar.gz"
  sha256 "8a78635c4e6f408c69ca05bd48d850c0e154f0006b506c2a95fe8eddb9bf6218"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/databendcloud/homebrew-tap/releases/download/bendsql-0.11.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e7fa777b09bde18193553c6f84edfe8e4b8c32dd19d06ae1d729a5d80d8b3e4c"
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
    assert_match "bendsql 0.11.3-homebrew\n", output
  end
end
