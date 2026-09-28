class Mdview < Formula
  desc "Native macOS Markdown viewer"
  homepage "https://github.com/hshankar/mdview"
  url "https://github.com/hshankar/mdview/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "91d22df8971c327e7f51809b33d3dd6345d3b797a8e51abd831e3dae9d83c63c"
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
