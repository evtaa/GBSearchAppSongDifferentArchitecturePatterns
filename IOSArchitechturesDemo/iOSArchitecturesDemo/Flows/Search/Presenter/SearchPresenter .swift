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
    
    weak var viewInput: (UIViewController & SearchViewInput)?
        
        private let searchService = ITunesSearchService()
        
        private func requestApps(with query: String) {
            self.searchService.getApps(forQuery: query) { [weak self] result in
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
        
        private func openAppDetails(with app: ITunesApp) {
            let appDetaillViewController = AppDetailViewController(app: app)
            self.viewInput?.navigationController?.pushViewController(appDetaillViewController, animated: true)
        }
    }

    // MARK: - SearchViewOutput
    extension SearchPresenter: SearchViewOutput {
        
        func viewDidSearch(with query: String) {
            self.viewInput?.throbber(show: true)
            self.requestApps(with: query)
        }
        
        func viewDidSelectApp(_ app: ITunesApp) {
            self.openAppDetails(with: app)
        }

    
}
