import Foundation

/// Helper to load localized strings from the plugin's resource bundle
struct FaceAILocalization {
    private static var _bundle: Bundle?

    static var bundle: Bundle {
        if let b = _bundle { return b }

        // Find the face_ai_sdk resource bundle within the plugin's framework bundle
        let frameworkBundle = Bundle(for: FaceAiSdkPlugin.self)

        if let resourceBundleURL = frameworkBundle.url(forResource: "face_ai_sdk", withExtension: "bundle"),
           let resourceBundle = Bundle(url: resourceBundleURL) {
            _bundle = resourceBundle
            return resourceBundle
        }

        // Fallback to framework bundle itself
        _bundle = frameworkBundle
        return frameworkBundle
    }

    /// Get a localized string from the plugin's resource bundle
    static func localized(_ key: String) -> String {
        return bundle.localizedString(forKey: key, value: key, table: nil)
    }

    /// Get a localized Face_Tips_Code string
    static func localizedTip(for code: Int, defaultPrefix: String = "Tips") -> String {
        let key = "Face_Tips_Code_\(code)"
        let defaultValue = "\(defaultPrefix) Code=\(code)"
        return bundle.localizedString(forKey: key, value: defaultValue, table: nil)
    }
}
