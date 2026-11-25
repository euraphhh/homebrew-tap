cask "cove" do
  version "0.6.0"
  sha256 "5fa050744c412d41f5caba47098675ab8bf10005e2ad774f94d7ba3e09f24940"

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
