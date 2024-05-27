class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/bendsql/archive/refs/tags/v0.18.2.tar.gz"
  sha256 "67b163255c848f54b81ffcd8e9cd8380f32003737c2d536141d5506a9a30c50a"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/databendcloud/homebrew-tap/releases/download/bendsql-0.18.2"
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
    assert_match "bendsql 0.18.2-homebrew\n", output
  end
end
