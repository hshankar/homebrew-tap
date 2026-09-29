class Mdview < Formula
  desc "Native macOS Markdown viewer"
  homepage "https://github.com/hshankar/mdview"
  url "https://github.com/hshankar/mdview/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "24b7255d4963f4255886d52d6b4ef1c39323515e7bd6efa94dfffcc837c9d9e2"
  license "MIT"

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/mdview"
    bin.install ".build/release/mdview_MDView.bundle"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mdview --version")
  end
end
