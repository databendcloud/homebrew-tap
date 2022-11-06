class Bendsql < Formula
  desc "Work seamlessly with Databend Cloud from the command-line."
  homepage "https://github.com/databendcloud/bendsql"
  url "https://github.com/databendcloud/bendsql/releases/download/v0.0.5/bendsql-darwin-amd64.tar.gz"
  sha256 "8379bace0a68115f704de4e1a4d0046ffc535ef0cd1518df520b53dc2431a8ed"
  license "Apache-2.0"
  version "v0.0.5"
  head "https://github.com/databendcloud/bendsql.git", branch: "main"

  depends_on "go" => :build

  def install
    bin.install "bendsql"
  end

  test do
    system "false"
  end
end
