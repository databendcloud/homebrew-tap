class Bendsql < Formula
  desc "Work seamlessly with Databend Cloud from the command-line."
  homepage "https://github.com/databendcloud/bendsql"
  url "https://github.com/databendcloud/bendsql/releases/download/v0.0.2/bendsql-darwin-amd64.tar.gz"
  sha256 "25c1a2a4e1922261535325634a939fe42a0ffcc12ae6c262ed7021dab611f622"
  license "Apache-2.0"
  version "v0.0.2"
  head "https://github.com/databendcloud/bendsql.git", branch: "main"

  depends_on "go" => :build

  def install
    bin.install "bendsql"
  end

  test do
    system "false"
  end
end