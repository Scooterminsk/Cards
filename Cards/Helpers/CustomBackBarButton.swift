//
//  CustomBackBarButton.swift
//  Cards
//
//  Created by Zenya Kirilov on 31.08.22.
//

import Foundation
import UIKit

// disabling long press back button (callout menu)
class BackBarButtonItem: UIBarButtonItem {
    @available(iOS 14.0, *)
    override var menu: UIMenu? {
        set {
            /* Don't set the menu here */
            /* super.menu = menu */
        }
        get {
            return super.menu
        }
    }
}
