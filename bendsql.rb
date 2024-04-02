class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/bendsql/archive/refs/tags/v0.16.0.tar.gz"
  sha256 "3456bd6b7bdd10fddc174bca3441bb7dbdc68be7f23f459ffe964dddf6eeda2e"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/databendcloud/homebrew-tap/releases/download/bendsql-0.13.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "73bd8d10ec27495a2aa3d3d81052f05e25d078479bef9c453e7bd24e76c02dfa"
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
    assert_match "bendsql 0.16.0-homebrew\n", output
  end
end
