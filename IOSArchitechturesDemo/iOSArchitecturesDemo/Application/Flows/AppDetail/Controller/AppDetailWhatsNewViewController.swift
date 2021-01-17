//
//  AppDetailWhatsNewViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Alexandr Evtodiy on 16.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailWhatsNewViewController: UIViewController {

    // MARK: - Properties

    private let app: ITunesApp
    
    private var appDetailWhatsNewView: AppDetailWhatsNewView {
        return self.view as! AppDetailWhatsNewView
    }
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter
    } ()
    
    // MARK: -Init
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = AppDetailWhatsNewView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }
    
    // MARK: - Private
    
    private func fillData () {
        self.appDetailWhatsNewView.titleLabel.text = "Что нового"
        self.appDetailWhatsNewView.versionLabel.text = "Версия \(app.appVersion ?? "no version")"
        self.appDetailWhatsNewView.descriptionCurrentReleaseVersionLabel.text = app.descriptionOfRelease
        if let dateOfRelease = app.dateOfRelease {
            self.appDetailWhatsNewView.dateOfVersionLabel.text = "Дата \(dateFormatter.string(from: dateOfRelease))"
        }
    }
}
