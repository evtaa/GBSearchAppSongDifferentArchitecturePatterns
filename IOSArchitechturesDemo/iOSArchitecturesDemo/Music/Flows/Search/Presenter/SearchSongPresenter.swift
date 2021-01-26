//
//  SearchSongPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Alexandr Evtodiy on 17.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import UIKit

protocol SearchSongViewOutput: class {
    
    func viewDidSearch(with query: String)
    
   // func viewDidSelectApp(_ song: ITunesSong)
}


final class SearchSongPresenter {
    
    // MARK: Properties
    weak var viewInput: (UIViewController & SearchSongViewInput)?
    let interactor: SearchMusicInteractorInput
    
    private let searchService = ITunesSearchService()
    
    // MARK: Init
    init(interactor: SearchMusicInteractorInput) {
        self.interactor = interactor
    }
}

// MARK: - SearchViewOutput
extension SearchSongPresenter: SearchSongViewOutput {
    
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        self.interactor.requestSongs(with: query) { [weak self] result in
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
}
