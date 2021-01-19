//
//  SearchSongModuleBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Alexandr Evtodiy on 17.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import UIKit

final class SearchSongModuleBuilder {
    
    static func build() -> (UIViewController & SearchSongViewInput) {
        let interactor = SearchMusicInteractor()
        let presenter = SearchSongPresenter(interactor: interactor)
        let viewController = SearchSongViewController(presenter: presenter)
        presenter.viewInput = viewController
        return viewController
    }
}
