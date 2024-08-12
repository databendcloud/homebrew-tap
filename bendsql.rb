class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/bendsql/archive/refs/tags/v0.20.1.tar.gz"
  sha256 "8fd2bdaabf592930a136fa32194dffa52288a1c4b140e91ccbad421c72192ab0"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/databendcloud/homebrew-tap/releases/download/bendsql-0.20.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "53261bfe8d578d9a7670246d05128d226d773e42ca15779a30d7060e3be4d66e"
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
    assert_match "bendsql 0.20.1-homebrew\n", output
  end
end
