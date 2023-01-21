//
//  ViewController.swift
//  struct-save-userdefaults-demo
//
//  Created by JotaroSugiyama on 2023/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var thumbnailImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        thumbnailImageView.image = UIImage(systemName: "photo.circle",withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 48)))
        thumbnailImageView.isUserInteractionEnabled = true
        thumbnailImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:))))
    }

    @objc func imageViewTapped(_ sender: UITapGestureRecognizer) {
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
        imagePickerController.delegate = self
     }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        thumbnailImageView.image = image
        thumbnailImageView.contentMode = .scaleAspectFit
        self.dismiss(animated: true, completion: nil)
    }
    
}
