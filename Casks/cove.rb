cask "cove" do
  version "0.4.0"
  sha256 "631c7f9035243040c846f08078c822acac1595e9ea641df78a83fa1f605b29ef"

  url "https://github.com/euraphhh/cove-macos/releases/download/v#{version}/Cove.zip"
  name "Cove"
  desc "Dynamic Island-style app for the MacBook notch"
  homepage "https://github.com/euraphhh/cove-macos"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Cove.app"

  # The app is not notarized; drop the quarantine flag so it opens normally.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Cove.app"]
  end

  uninstall quit: "com.euraphhh.cove"

  zap trash: [
    "~/Library/Caches/com.euraphhh.cove",
    "~/Library/HTTPStorages/com.euraphhh.cove",
    "~/Library/Preferences/com.euraphhh.cove.plist",
  ]
end
