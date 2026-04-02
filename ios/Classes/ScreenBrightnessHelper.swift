import UIKit

public class ScreenBrightnessHelper {

    public static let shared = ScreenBrightnessHelper()

    private var originalBrightness: CGFloat?
    private var wasIdleTimerDisabled: Bool = false
    private var isMaximized = false

    private init() {}

    public func maximizeBrightness() {
        runOnMain { [weak self] in
            guard let self = self else { return }

            if !self.isMaximized {
                self.originalBrightness = self.getCurrentBrightness()
                self.wasIdleTimerDisabled = UIApplication.shared.isIdleTimerDisabled
                self.isMaximized = true
            }

            self.setBrightness(1.0)
            UIApplication.shared.isIdleTimerDisabled = true
        }
    }

    public func restoreBrightness() {
        runOnMain { [weak self] in
            guard let self = self else { return }

            guard self.isMaximized, let original = self.originalBrightness else { return }

            self.setBrightness(original)
            UIApplication.shared.isIdleTimerDisabled = self.wasIdleTimerDisabled

            self.isMaximized = false
            self.originalBrightness = nil
        }
    }

    private func getCurrentBrightness() -> CGFloat {
        if #available(iOS 15.0, *) {
            let scene = UIApplication.shared.connectedScenes
                .filter { $0.activationState == .foregroundActive }
                .compactMap { $0 as? UIWindowScene }
                .first
            return scene?.screen.brightness ?? UIScreen.main.brightness
        } else {
            return UIScreen.main.brightness
        }
    }

    private func setBrightness(_ value: CGFloat) {
        if #available(iOS 15.0, *) {
            if let scene = UIApplication.shared.connectedScenes
                .filter({ $0.activationState == .foregroundActive })
                .compactMap({ $0 as? UIWindowScene })
                .first {
                scene.screen.brightness = value
            } else {
                UIScreen.main.brightness = value
            }
        } else {
            UIScreen.main.brightness = value
        }
    }

    private func runOnMain(_ block: @escaping () -> Void) {
        if Thread.isMainThread {
            block()
        } else {
            DispatchQueue.main.async {
                block()
            }
        }
    }
}
