class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.com"
  url "https://github.com/databendlabs/bendsql/archive/refs/tags/v0.34.0.tar.gz"
  sha256 "25e7403cb6eb22e8f3db93a4430f075d5db5d08c7e6918e67561040acf2c6f7a"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/databendcloud/homebrew-tap/releases/download/bendsql-0.33.7"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "6fdde25766b10b66de713163404a8a9b6c84f392a3991f8c3713c2f02d6c02e6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bb179036e6283dfa3baeefc48dbf57bd07f881b0325577389a8d3c1fb3fae8aa"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "fcd2749e75050284802af291b222261df664a4b3e98595a39abfe03dc9fb52c1"
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
    assert_match "bendsql 0.34.0-homebrew\n", output
  end
end
