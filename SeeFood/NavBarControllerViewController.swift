//
//  NavBarControllerViewController.swift
//  SeeFood
//
//  Created by Vitali Martsinovich on 2023-05-26.
//

import UIKit

protocol cameraButtonProtocol: AnyObject {
    func cameraButtonTapped()
}

class NavBarControllerViewController: UINavigationController {
    
    weak var delegateCameraButton: cameraButtonProtocol?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        config()
    }

    private func config() {
        navigationBar.backgroundColor = .clear
        navigationBar.tintColor = .label
        let cameraButton = UIBarButtonItem(image: UIImage(systemName: "camera"), style: .plain, target: self, action: #selector(cameraButtonTapped))
        topViewController?.navigationItem.rightBarButtonItem = cameraButton
    }
    
    @objc func cameraButtonTapped() {
        delegateCameraButton?.cameraButtonTapped()
    }
}

    
