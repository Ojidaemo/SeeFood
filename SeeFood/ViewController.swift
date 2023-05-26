//
//  ViewController.swift
//  SeeFood
//
//  Created by Vitali Martsinovich on 2023-05-26.
//

import UIKit
import CoreML
import Vision

final class ViewController: UIViewController {
    
    private let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        configureImagePicker()
        setDelegates()
    }
    
    func setDelegates() {
        imagePicker.delegate = self
    }
    
    //MARK: - UI elements
    
    private var cameraImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()
    
    func configureImagePicker() {
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
    }
    
    private func setupViews() {
        view.backgroundColor = .systemMint
        view.addSubview(cameraImage)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cameraImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cameraImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            cameraImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cameraImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            cameraImage.image = userPickedImage
        }
        imagePicker.dismiss(animated: true)
    }
}

//MARK: - Camera button delegate
extension ViewController: cameraButtonProtocol {
    func cameraButtonTapped() {
        print("Camera tapped")
        present(imagePicker, animated: true)
    }
}

