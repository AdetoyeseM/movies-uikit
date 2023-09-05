//
//  DetailRouter.swift
//  movies_uikit
//
//  Created by Ademola Fadumo on 03/09/2023.
//

import Foundation
import UIKit

protocol DetailRouterDelegate: AnyObject {
    var entry: EntryPoint? { get }
}

class DetailRouter: DetailRouterDelegate {

    var entry: EntryPoint?

    static func route() -> DetailRouter {
        print("initializing details route")
        let router = DetailRouter()

        // Assign VIP
        let view = DetailViewController()
        let presenter = DetailPresenter()
        let interactor = DetailInteractor()

        // setup view controller with presenter
        view.presenter = presenter

        // setup interactor with presenter
        interactor.presenter = presenter
        interactor.moviesRepository =
        (UIApplication.shared.delegate as? AppDelegate)?
            .repositoryProvider
            .moviesRepository

        // setup presenter with router, view and interactor
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor

        // setup router entry with specific view controller
        router.entry = view
        print("finished initializing details route")
        return router
    }

    func push(to route: Routes, from vc: UIViewController) {}

    func pop(from vc: UIViewController) {}
}
