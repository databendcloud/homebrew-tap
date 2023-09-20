class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/databend-client/archive/v0.6.7.tar.gz"
  sha256 "91b68bd6eb06216427100515299b3ca7f17d8efc8f7f9f3722842908ea405ef3"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/databendcloud/homebrew-tap/releases/download/bendsql-0.6.6"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "b66fe28b54bb825dabafc4b4888d5d0499fe91fba3f8aa37d6a68d33cee611f4"
    sha256 cellar: :any_skip_relocation, monterey:      "f0c7b51337a2164065178098d06bc77acf0a37baca5b4da33fe2ec76087d6501"
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
    assert_match "bendsql 0.6.7-homebrew\n", output
  end
end
