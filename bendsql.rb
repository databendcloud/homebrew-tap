class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/bendsql/archive/refs/tags/v0.13.2.tar.gz"
  sha256 "c80d3d1a90bce15e42fac744d1512ec7e6e827c8a13591696a9d052ccf465ca1"
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
    assert_match "bendsql 0.13.2-homebrew\n", output
  end
end
