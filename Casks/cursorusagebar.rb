cask "cursorusagebar" do
  version "1.1"
  sha256 "c6329427b9c316fce087ef1f2e8d0c8f931571a3a944c025e112dee5b53cedf1"

  # Points at this repo's own GitHub Release asset. Scripts/cut_release.sh
  # tags a release, uploads the zip, and prints the version/sha256 to paste
  # here.
  url "https://github.com/itayshaked/cursor-usage-bar/releases/download/v#{version}/CursorUsageBar.zip"
  name "Cursor Usage"
  desc "Menu bar app showing Cursor usage/spend against your limit"
  homepage "https://github.com/itayshaked/cursor-usage-bar"

  depends_on macos: :ventura

  # Signed with a Developer ID and notarized by Apple, so no quarantine
  # workaround is needed — `brew install` just works.
  app "CursorUsageBar.app"

  zap trash: [
    "~/Library/Preferences/com.local.cursorusagebar.plist",
  ]
end
