@objc(ChangeIcon)
class ChangeIcon: NSObject {

    @objc
    static func requiresMainQueueSetup() -> Bool {
        return false
    }

    @available(iOS 10.3, *)
    @objc(changeIcon:withResolver:withRejecter:)
    func changeIcon(iconName: String, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        if !UIApplication.shared.supportsAlternateIcons {
            reject("Error", "Alternate icon not supported", nil)
            return
        }
        let currentIcon = UIApplication.shared.alternateIconName
        if (iconName == "AppIcon" && (iconName == currentIcon || currentIcon == nil)) {
            reject("Error", "Already in primary icon", nil)
            return
        } else if (iconName == currentIcon) {
            reject("Error", "Icon already in use", nil)
            return
        } else if (iconName == "" || iconName=="AppIcon"  ) {
            resolve(true)
            UIApplication.shared.setAlternateIconName(nil)
            return
        } else {
            resolve(true)
            UIApplication.shared.setAlternateIconName(iconName)
            return
        }
    }
}