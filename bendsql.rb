class Bendsql < Formula
  desc "Work seamlessly with Databend Cloud from the command-line."
  homepage "https://github.com/databendcloud/bendsql"
  url "https://github.com/databendcloud/bendsql/releases/download/v0.0.6/bendsql-darwin-amd64.tar.gz"
  sha256 "371b8b27f38013442c1b368f9d667609dc5502959a976976124339763d1fa5e9"
  license "Apache-2.0"
  version "v0.0.6"
  head "https://github.com/databendcloud/bendsql.git", branch: "main"

  depends_on "go" => :build

  def install
    bin.install "bendsql"
  end

  test do
    system "false"
  end
end
