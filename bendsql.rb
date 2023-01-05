class Bendsql < Formula
  desc "Work seamlessly with Databend Cloud from the command-line."
  homepage "https://github.com/databendcloud/bendsql"
  url "https://github.com/databendcloud/bendsql/releases/download/v0.1.2/bendsql-darwin-amd64.tar.gz"
  sha256 "9b9b1b174e502547fdedfaa2af401d60592b1da9feb7e8a6221d3c130643f135"
  license "Apache-2.0"
  version "v0.1.2"
  head "https://github.com/databendcloud/bendsql.git", branch: "main"

  depends_on "go" => :build

  def install
    bin.install "bendsql"
  end

  test do
    system "false"
  end
end
