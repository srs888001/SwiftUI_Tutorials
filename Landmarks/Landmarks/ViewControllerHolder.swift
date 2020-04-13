//
//  ViewControllerHolder.swift
//  Landmarks
//
//  Created by SRS on 2020/3/31.
//  Copyright © 2020 agora. All rights reserved.
//

import SwiftUI

struct ViewControllerHolder {
    weak var value: UIViewController?
}


struct ViewControllerKey: EnvironmentKey {
    static var defaultValue: ViewControllerHolder {
        return ViewControllerHolder(value: UIApplication.shared.windows.first?.rootViewController)
    }
}

extension EnvironmentValues {
    var viewController: ViewControllerHolder {
        get { return self[ViewControllerKey.self] }
        set { self[ViewControllerKey.self] = newValue }
    }
}


extension UIViewController {
    func present<Content: View>(style: UIModalPresentationStyle = .automatic, @ViewBuilder builder: () -> Content) {
        // Must instantiate HostingController with some sort of view...
        let toPresent = UIHostingController(rootView: AnyView(EmptyView()))
        toPresent.modalPresentationStyle = style
        // ... but then we can reset rootView to include the environment
        toPresent.rootView = AnyView(
            builder()
                .environment(\.viewController, ViewControllerHolder(value: toPresent))
        )
        self.present(toPresent, animated: true, completion: nil)
    }
    
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}
