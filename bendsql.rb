class Bendsql < Formula
  desc "Work seamlessly with Databend Cloud from the command-line."
  homepage "https://github.com/databendcloud/bendsql"
  url "https://github.com/databendcloud/bendsql/releases/download/v0.3.9/bendsql-darwin-amd64.tar.gz"
  sha256 "2129001b1ee9836c3feb006391928d25a2ee459cd038d0548c727458c2f34938"
  license "Apache-2.0"
  version "v0.3.9"
  head "https://github.com/databendcloud/bendsql.git", branch: "main"

  depends_on "go" => :build

  def install
    bin.install "bendsql"
  end

  test do
    system "false"
  end
end
