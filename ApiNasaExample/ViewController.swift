//
//  ViewController.swift
//  ApiNasaExample
//
//  Created by José Henrique Fernandes Silva on 28/08/20.
//  Copyright © 2020 José Henrique Fernandes Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        load()
    }
    
    func load() {
        
        let stringURL = "https://api.nasa.gov/planetary/apod?date=2001-04-30&hd=true&api_key=dYH0lRMSlSXTg8fYucpDiHfUSIjghqrFKzMf6C3y"
        let url = URL(string: stringURL)!
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            do {
                let decoder = JSONDecoder()
                let apodData: Apod = try decoder.decode(Apod.self, from: data!)
                
                // Baixar imagem e atualizar imagemView
                self.updateImage(apodData.hdurl)
                
            } catch {
                print("Erro ao decodificar dados da API")
            }
        }
        task.resume()
    }
    
    func updateImage(_ url:String) {
        DispatchQueue.global().async {
            let data: Data
            do {
                // Baixar conteúdo da url
                data = try Data(contentsOf: URL(string: url)!)
            } catch {
                print("Erro ao tentar baixar imagem")
                return
            }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
    }


}
