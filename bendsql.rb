class Bendsql < Formula
  desc "Databend Native Command-Line Tool"
  homepage "https://databend.rs"
  url "https://github.com/datafuselabs/bendsql/archive/refs/tags/v0.12.1.tar.gz"
  sha256 "3fdb796162e91f20a0633277671fcec386855f93eb69982478ae593393efc103"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/databendcloud/homebrew-tap/releases/download/bendsql-0.12.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "8e0b9ba9ca1471295787702a34af526fdee3d0c68e1aa660a1fc17107a78be21"
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
    assert_match "bendsql 0.12.1-homebrew\n", output
  end
end
