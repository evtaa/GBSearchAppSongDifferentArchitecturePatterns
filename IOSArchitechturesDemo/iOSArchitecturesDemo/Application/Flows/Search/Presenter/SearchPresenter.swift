//
//  SearchPresenter .swift
//  iOSArchitecturesDemo
//
//  Created by Alexandr Evtodiy on 15.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import UIKit

protocol SearchViewOutput: class {
    
    func viewDidSearch(with query: String)
    
    func viewDidSelectApp(_ app: ITunesApp)
}


final class SearchPresenter {
    
    // MARK: Properties
    weak var viewInput: (UIViewController & SearchViewInput)?
    let interactor: SearchInteractorInput
    let router: SearchRouterInput
    
    // MARK: Init
    init(interactor: SearchInteractorInput, router: SearchRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    }

    // MARK: - SearchViewOutput
    extension SearchPresenter: SearchViewOutput {
        
        func viewDidSearch(with query: String) {
            self.viewInput?.throbber(show: true)
            self.interactor.requestApps(with: query) {  [weak self] result in
                guard let self = self else { return }
                self.viewInput?.throbber(show: false)
                result
                    .withValue { apps in
                        guard !apps.isEmpty else {
                            self.viewInput?.showNoResults()
                            return
                        }
                        self.viewInput?.hideNoResults()
                        self.viewInput?.searchResults = apps
                    }
                    .withError {
                        self.viewInput?.showError(error: $0)
                    }
            }
        }
        
        func viewDidSelectApp(_ app: ITunesApp) {
            self.router.openDetails(for: app)
        }

    
}
