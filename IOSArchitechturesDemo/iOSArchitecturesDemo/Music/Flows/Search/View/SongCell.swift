//
//  SongCell.swift
//  iOSArchitecturesDemo
//
//  Created by Alexandr Evtodiy on 16.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    // MARK: - Subviews
    
    private(set) lazy var imageTrackView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30.0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private(set) lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    
    private(set) lazy var collectionNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12.0)
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func configure(with cellModel: SongCellModel) {
        self.imageTrackView.image = cellModel.image
        self.trackNameLabel.text = cellModel.trackName
        self.artistNameLabel.text = cellModel.artistName
        self.collectionNameLabel.text = cellModel.collectionName
    }
    
    // MARK: - UI
    
    override func prepareForReuse() {
        [self.trackNameLabel, self.artistNameLabel, self.collectionNameLabel].forEach { $0.text = nil }
    }

    private func configureUI() {
        self.addImageTrackView()
        self.addTrackNameLabel()
        self.addArtistNameLabel()
        self.addCollectionNameLabel()
    }
    
    private func addImageTrackView() {
        self.contentView.addSubview(self.imageTrackView)
        NSLayoutConstraint.activate([
            self.imageTrackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.imageTrackView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.imageTrackView.widthAnchor.constraint(equalToConstant: 56.0),
            self.imageTrackView.heightAnchor.constraint(equalToConstant: 56.0)
            ])
    }
    
    private func addTrackNameLabel() {
        self.contentView.addSubview(self.trackNameLabel)
        NSLayoutConstraint.activate([
            self.trackNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.trackNameLabel.leftAnchor.constraint(equalTo: self.imageTrackView.rightAnchor, constant: 12.0),
            self.trackNameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addArtistNameLabel() {
        self.contentView.addSubview(self.artistNameLabel)
        NSLayoutConstraint.activate([
            self.artistNameLabel.topAnchor.constraint(equalTo: self.trackNameLabel.bottomAnchor, constant: 4.0),
            self.artistNameLabel.leftAnchor.constraint(equalTo: self.imageTrackView.rightAnchor, constant: 12.0),
            self.artistNameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addCollectionNameLabel() {
        self.contentView.addSubview(self.collectionNameLabel)
        NSLayoutConstraint.activate([
            self.collectionNameLabel.topAnchor.constraint(equalTo: self.artistNameLabel.bottomAnchor, constant: 4.0),
            self.collectionNameLabel.leftAnchor.constraint(equalTo: self.imageTrackView.rightAnchor, constant: 12.0),
            self.collectionNameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }

}
