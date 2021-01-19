//
//  SearchModuleBuilder .swift
//  iOSArchitecturesDemo
//
//  Created by Alexandr Evtodiy on 15.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import UIKit

final class SearchModuleBuilder {
    
    static func build() -> (UIViewController & SearchViewInput) {
        let router = SearchRouter()
        let interactor = SearchInteractor()
        let presenter = SearchPresenter(interactor: interactor, router: router)
        let viewController = SearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        router.viewController = viewController
        return viewController
    }
}
