class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/bendsql/archive/refs/tags/v0.12.5.tar.gz"
  sha256 "054ae4672df5626df561e0bdcd0ffc30e7038d9140c5f0fb41f14b08fed7ac82"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/databendcloud/homebrew-tap/releases/download/bendsql-0.12.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "1f5ea63aca37e4bc1d0e42be4a14b2b50d1b80dcd91ffac4e093c0126a043c81"
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
    assert_match "bendsql 0.12.5-homebrew\n", output
  end
end
