//
//  AppDetailWhatsNewView.swift
//  iOSArchitecturesDemo
//
//  Created by Alexandr Evtodiy on 16.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailWhatsNewView: UIView {

   // MARK: Subview
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 1
        return label
    } ()
    
    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 1
        return label
    } ()
    
    private(set) lazy var descriptionCurrentReleaseVersionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 0
        return label
    } ()
    
    private(set) lazy var dateOfVersionLabel: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 1
        return label
    } ()
    
    // MARK: -Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout () {
        self.addSubview(titleLabel)
        self.addSubview(versionLabel)
        self.addSubview(descriptionCurrentReleaseVersionLabel)
        self.addSubview(dateOfVersionLabel)
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            self.titleLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0),
            self.titleLabel.widthAnchor.constraint(equalToConstant: 120),
            
            self.versionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 12),
            self.versionLabel.leftAnchor.constraint(equalTo: self.titleLabel.leftAnchor),
            self.versionLabel.rightAnchor.constraint(equalTo: self.titleLabel.rightAnchor),
            
            self.descriptionCurrentReleaseVersionLabel.topAnchor.constraint(equalTo: self.versionLabel.bottomAnchor, constant: 12),
            self.descriptionCurrentReleaseVersionLabel.leftAnchor.constraint(equalTo: self.versionLabel.leftAnchor),
            self.descriptionCurrentReleaseVersionLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16.0),
            self.descriptionCurrentReleaseVersionLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            self.dateOfVersionLabel.topAnchor.constraint(equalTo: self.versionLabel.topAnchor),
            self.dateOfVersionLabel.leftAnchor.constraint(equalTo: self.versionLabel.rightAnchor, constant: 16),
            self.dateOfVersionLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16)
            
        ])
        
    }
}
