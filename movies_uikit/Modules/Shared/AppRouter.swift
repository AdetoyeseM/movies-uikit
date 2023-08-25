//
//  AppRouter.swift
//  movies_uikit
//
//  Created by Ademola Fadumo on 25/08/2023.
//

import Foundation
import UIKit

/// Register routes in app
enum Routes: String {
    case launch = "/launch"
    case home = "/home"
    
    var vc: UIViewController {
        switch self {
        case .launch:
            return LaunchRouter.route().entry!
        case .home:
            return HomeRouter.route().entry!
        }
    }
}
