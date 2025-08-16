class SwiftReport < Formula
  desc "Print Xcode, macOS and Swift versions in a compact format"
  homepage "https://github.com/nashysolutions/swift-report"
  url "https://github.com/nashysolutions/swift-report/archive/refs/tags/1.0.0.tar.gz"
  sha256 "78012486a590b4f2ead08fbd1f1f1fd354614fa4ed15eb4db6a72d4ed84d3e53"
  license "MIT"

  depends_on xcode: ["15.0", :build]

  def install
    ENV["DEVELOPER_DIR"] = "/Applications/Xcode.app/Contents/Developer"
    ENV["SWIFTPM_DISABLE_SANDBOX"] = "1"
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/swift-report"
  end

  test do
    system "#{bin}/swift-report"
  end
end