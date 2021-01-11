//
//  ViewController.swift
//  Foto_Alura
//
//  Created by Grazi Berti on 11/01/21.
//

import UIKit
// É preciso pedir permissão para ter acesso a alguns recursos do device, como por exemplo, a camera. Tem que ir no arquivo Info.plist e pedir autorização
        // Info.plist > Privacy - Camera Usage Description


class ViewController: UIViewController, ImagePickerFotoSelecionada {
    

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    // MARK: Atributos
    let imagePicker = ImagePicker()
    
    func mostrarMultimidia(opcao: MenuDeOpcoes) {
        let multimidia = UIImagePickerController()
        multimidia.delegate = imagePicker
        
        if opcao == .camera && UIImagePickerController.isSourceTypeAvailable(.camera) {
            multimidia.sourceType = .camera
        }
        else {
            multimidia.sourceType = .photoLibrary
        }
            self.present(multimidia, animated: true, completion: nil)
        }
    
    // MARK: Delegate
    func imagePickerFotoSelecionada(_ foto: UIImage) {
        imageView.image = foto
    }
    
    // MARK: IBActions
    @IBAction func buttonPicture(_ sender: Any) {
        
        let menu = ImagePicker().menuDeOpcoes { (opcao) in
            self.mostrarMultimidia(opcao: opcao)
        }
        present(menu, animated: true, completion: nil)
        
        
        
        
        
    }
    
    // MARK: Métodos
    //informaçoes do delegate
    func setup() {
        imagePicker.delegate = self
    }
}


