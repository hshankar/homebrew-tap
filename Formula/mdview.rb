class Mdview < Formula
  desc "Native macOS Markdown viewer"
  homepage "https://github.com/hshankar/mdview"
  url "https://github.com/hshankar/mdview/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "e9b6b7874b211af7189e66a08139072a2a61d1bbf6986e45050351b92c0f6f0c"
  license "MIT"

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/mdview"
    bin.install ".build/release/mdview_MDView.bundle"

    app = prefix/"MDView.app"
    system buildpath/"scripts/create-app-bundle.sh",
           bin/"mdview",
           app,
           opt_bin/"mdview"
  end

  post_install_steps do
    if_path_exists "MDView.app", base: :prefix do
      run "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
          args: ["-gc"]
      run "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
          args: ["-f", "{{opt_prefix}}/MDView.app"]
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mdview --version")
    assert_predicate prefix/"MDView.app", :directory?
  end
end
