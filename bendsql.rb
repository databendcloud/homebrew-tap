class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.com"
  url "https://github.com/databendlabs/bendsql/archive/refs/tags/v0.34.1.tar.gz"
  sha256 "42deae178c2ca99c79b29ef05c6b114bb68ad2568c9bf880bc7193be960d8f9e"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/databendcloud/homebrew-tap/releases/download/bendsql-0.34.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "98e56977b37a528c7728e3a9a8f454046fe4b5e9d221f1b51a094424a0922b76"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e2cae59f1e0a19ae276a584aaabd2edbd5ae6ed7d33a85bbcf956465faa5f9cc"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "5ec232eb68a0837694d9dc28b7d982d8bc08e80bbacd6a53c0547e3aba002fd7"
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
    assert_match "bendsql 0.34.1-homebrew\n", output
  end
end
