//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Alexandr Evtodiy on 17.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import UIKit

struct SongCellModel {
    let image: UIImage?
    let trackName: String
    let artistName: String?
    let collectionName: String?
}

final class SongCellModelFactory {
    
    static func cellModel(from model: ITunesSong) -> SongCellModel {
        return SongCellModel(image: UIImage(named: "note"),
                             trackName: model.trackName,
                             artistName: model.artistName,
                             collectionName: model.collectionName)
    }
}
