cask "cove" do
  version "0.7.0"
  sha256 "aac5e15a905cdf1e08722f9fdf79ef9deeb4a954dc06932e012615117c650908"

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
