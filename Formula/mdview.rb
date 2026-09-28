class Mdview < Formula
  desc "Native macOS Markdown viewer"
  homepage "https://github.com/hshankar/mdview"
  url "https://github.com/hshankar/mdview/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "c3e85633bf1c66a612ecb56888a8f82ad3af838cfb960f2fcc8cf1df84cf0c85"
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
