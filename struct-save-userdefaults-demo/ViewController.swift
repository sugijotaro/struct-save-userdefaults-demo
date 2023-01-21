//
//  ViewController.swift
//  struct-save-userdefaults-demo
//
//  Created by JotaroSugiyama on 2023/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var thumbnailImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetInputs()
        thumbnailImageView.isUserInteractionEnabled = true
        thumbnailImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:))))
    }
    
    @IBAction func saveButtonTapped() {
        if let title = titleTextField.text, let description = descriptionTextField.text, let thumbnail = thumbnailImageView.image {
            let movie = Movie(title: title, description: description, thumbnail: thumbnail.jpegData(compressionQuality: 1)!)
            addMovies(movie: movie, forKey: "movies")
            showAlert(message: "保存完了")
        } else {
            showAlert(message: "すべての項目を埋めてください")
        }
    }


    @objc func imageViewTapped(_ sender: UITapGestureRecognizer) {
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
        imagePickerController.delegate = self
     }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func resetInputs() {
        titleTextField.text = ""
        descriptionTextField.text = ""
        thumbnailImageView.image = UIImage(systemName: "photo.circle",withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 48)))
    }
    
    func addMovies(movie: Movie,forKey: String) {
        var movies = loadMoies(forKey: forKey)
        movies?.append(movie)
        saveMovies(movies: movies!, forKey: forKey)
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
