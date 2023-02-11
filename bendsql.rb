class Bendsql < Formula
  desc "Work seamlessly with Databend Cloud from the command-line."
  homepage "https://github.com/databendcloud/bendsql"
  url "https://github.com/databendcloud/bendsql/releases/download/v0.3.1/bendsql-darwin-amd64.tar.gz"
  sha256 "6fe4da0186b9d851ea721adb8eb6ad640cc6bc3d3db981ffb9d5ef569829a086"
  license "Apache-2.0"
  version "v0.3.1"
  head "https://github.com/databendcloud/bendsql.git", branch: "main"

  depends_on "go" => :build

  def install
    bin.install "bendsql"
  end

  test do
    system "false"
  end
end
