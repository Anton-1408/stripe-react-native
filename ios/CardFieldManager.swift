import Foundation

@objc(CardFieldManager)
class CardFieldManager: RCTViewManager {
    override func view() -> UIView! {
        let cardField = CardFieldView()
        let stripeSdk = bridge.module(forName: "StripeSdk") as? StripeSdk
        stripeSdk?.cardFieldView = cardField
        return cardField
    }

    @objc func focus(_ reactTag: NSNumber) {
        self.bridge?.uiManager.addUIBlock { (_, viewRegistry) in
            guard let view = viewRegistry?[reactTag] as? CardFieldView else { return }
            view.focus()
        }
    }

    @objc func blur(_ reactTag: NSNumber) {
        self.bridge?.uiManager.addUIBlock { (_, viewRegistry) in
            guard let view = viewRegistry?[reactTag] as? CardFieldView else { return }
            view.blur()
        }
    }

    @objc func clear(_ reactTag: NSNumber) {
        self.bridge?.uiManager.addUIBlock { (_, viewRegistry) in
            guard let view = viewRegistry?[reactTag] as? CardFieldView else { return }
            view.clear()
        }
    }

    override class func requiresMainQueueSetup() -> Bool {
        return false
    }
}
