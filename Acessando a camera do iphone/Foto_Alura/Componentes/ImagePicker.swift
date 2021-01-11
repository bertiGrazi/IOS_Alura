//
//  ImagePicker.swift
//  Foto_Alura
//
//  Created by Grazi Berti on 11/01/21.
//

import UIKit

enum MenuDeOpcoes {
    case camera
    case biblioteca
}

protocol ImagePickerFotoSelecionada {
    func imagePickerFotoSelecionada (_ foto: UIImage)
}

class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Atributos
    var delegate: ImagePickerFotoSelecionada?
    //MARK: Métodos
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // pegando a foto
        let foto = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        delegate?.imagePickerFotoSelecionada(foto)
        //fechando
        picker.dismiss(animated: true, completion: nil)
    }
    
    func menuDeOpcoes(completion:@escaping(_ opcao: MenuDeOpcoes) -> Void) -> UIAlertController {
        let menu = UIAlertController(title: "Atenção",
                                     message: "Escolha uma das opções abaixo: ",
                                     preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Tirar foto",
                                   style: .default) { (acao) in
            // o que vamos fazer quando o usuário clicar nesse opção
            completion(.camera)
        }
        
        let biblioteca = UIAlertAction(title: "Ir para biblioteca",
                                       style: .default) { (acao) in
            // o que vamos fazer quando o usuário clicar nesse opção
            completion(.biblioteca)
        }
        
        let cancelar = UIAlertAction(title: "Cancelar",
                                     style: .cancel,
                                     handler: nil)
        menu.addAction(camera)
        menu.addAction(biblioteca)
        menu.addAction(cancelar)
        return menu
    }
}
