class Mdview < Formula
  desc "Native macOS Markdown viewer"
  homepage "https://github.com/hshankar/mdview"
  url "https://github.com/hshankar/mdview/archive/refs/tags/v0.1.11.tar.gz"
  sha256 "56ae3cb0d362583586ee9e1598f9afd8ba536542a4630ae995674b6162b9ee55"
  license "MIT"

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"

    build_bin = buildpath/".build/release"
    app = prefix/"MDView.app"
    system (buildpath/"scripts/create-app-bundle.sh").to_s,
           (build_bin/"mdview").to_s,
           app.to_s,
           (opt_bin/"mdview").to_s

    bin.install build_bin/"mdview"
    bin.install build_bin/"mdview_MDView.bundle"
  end

  def caveats
    <<~EOS
      MDView.app is installed at:
        #{opt_prefix}/MDView.app

      Open it once to register it with macOS Launch Services:
        open "#{opt_prefix}/MDView.app"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mdview --version")
    assert_predicate prefix/"MDView.app", :directory?
  end
end
