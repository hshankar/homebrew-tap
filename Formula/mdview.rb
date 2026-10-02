class Mdview < Formula
  desc "Native macOS Markdown viewer"
  homepage "https://github.com/hshankar/mdview"
  url "https://github.com/hshankar/mdview/releases/download/v0.1.12/mdview-0.1.12-macos-universal.tar.gz"
  sha256 "1e3ee394908dc14e13298d84791eecf6a710e675f169169df67cb1c6c7c8e99e"
  license "MIT"

  depends_on macos: :ventura

  def install
    app = prefix/"MDView.app"
    system (buildpath/"create-app-bundle.sh").to_s,
           (buildpath/"mdview").to_s,
           app.to_s,
           (opt_bin/"mdview").to_s

    bin.install "mdview"
    bin.install "mdview_MDView.bundle"
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
