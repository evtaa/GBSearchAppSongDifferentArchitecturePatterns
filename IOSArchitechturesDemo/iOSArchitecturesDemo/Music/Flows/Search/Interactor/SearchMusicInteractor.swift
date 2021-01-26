//
//  SearchMusicInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Alexandr Evtodiy on 19.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import Alamofire

protocol SearchMusicInteractorInput {
    
    func requestSongs(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void)
}

final class SearchMusicInteractor: SearchMusicInteractorInput {
    
    private let searchService = ITunesSearchService()
    
    func requestSongs(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void) {
        self.searchService.getSongs(forQuery: query, completion: completion)
    }
}
