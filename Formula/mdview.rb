class Mdview < Formula
  desc "Native macOS Markdown viewer"
  homepage "https://github.com/hshankar/mdview"
  url "https://github.com/hshankar/mdview/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "7f27c9bd135bf6002580104852c1065f72956228b3cf65354da9528ea4d98dba"
  license "MIT"

  def install
    system "swift", "build", "-c", "release"
    bin.install ".build/release/mdview"
    bin.install ".build/release/mdview_MDView.bundle"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mdview --version")
  end
end
