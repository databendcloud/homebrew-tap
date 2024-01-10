class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/bendsql/archive/refs/tags/v0.12.3.tar.gz"
  sha256 "1e8584b4820f0475c1fff3e277b85280af0e50e194d600daa54c3ee96bebbe51"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/databendcloud/homebrew-tap/releases/download/bendsql-0.12.3"
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
    assert_match "bendsql 0.12.3-homebrew\n", output
  end
end
