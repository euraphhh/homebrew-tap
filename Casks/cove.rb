cask "cove" do
  version "0.2.0"
  sha256 "853156bb6e239a890def60951be503b6cbc445e917802c3687aa37556766b79b"

  url "https://github.com/euraphhh/cove-macos/releases/download/v#{version}/Cove.zip"
  name "Cove"
  desc "Dynamic Island-style app for the MacBook notch"
  homepage "https://github.com/euraphhh/cove-macos"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Cove.app"

  # The app is not notarized; drop the quarantine flag so it opens normally.
  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Cove.app"]
  end

  uninstall quit: "com.euraphhh.cove"

  zap trash: [
    "~/Library/Preferences/com.euraphhh.cove.plist",
    "~/Library/Caches/com.euraphhh.cove",
    "~/Library/HTTPStorages/com.euraphhh.cove",
  ]
end
