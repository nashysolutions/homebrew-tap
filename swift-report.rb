class SwiftReport < Formula
  desc "Print Xcode, macOS and Swift versions in a compact format"
  homepage "https://github.com/nashysolutions/swift-report"
  url "https://github.com/nashysolutions/swift-report/archive/refs/tags/1.0.0.tar.gz"
  sha256 "938fbebc883bd4207dbaa38fd8a4e2feca3ff8a26aa44936fb7c573a9f079181  swift-report-1.0.0.tar"
  license "MIT"

  depends_on xcode: ["15.0", :build]

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    # Smoke test: should run without crashing and print at least one line
    output = shell_output("#{bin}/swift-report")
    assert_match "*", output
  end
end
