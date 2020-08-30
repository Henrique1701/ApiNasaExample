//
//  ImageViewController.swift
//  ApiNasaExample
//
//  Created by José Henrique Fernandes Silva on 28/08/20.
//  Copyright © 2020 José Henrique Fernandes Silva. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var image = UIImage()
    var dataString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(dataString)
        load(dataString)
    }
    
    func load(_ data:String) {
        
        print("entrou")
        print(data)
        
        let stringURL = "https://api.nasa.gov/planetary/apod?date=\(data)&hd=true&api_key=dYH0lRMSlSXTg8fYucpDiHfUSIjghqrFKzMf6C3y"
        let url = URL(string: stringURL)!
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            do {
                let decoder = JSONDecoder()
                let apodData: Apod = try decoder.decode(Apod.self, from: data!)
                
                // Baixar imagem e atualizar imagemView
                self.updateImage(apodData.url)
                
            } catch {
                print("Erro ao decodificar dados da API")
            }
        }
        task.resume()
    }
    
    func updateImage(_ url:String) {
        print("Entrou na função updateImage")
        DispatchQueue.global().async {
            print("Vai tentar baixar conteúdo da url")
            let data: Data
            do {
                // Baixar conteúdo da url
                print(url)
                data = try Data(contentsOf: URL(string: url)!)
            } catch {
                print("Erro ao tentar baixar imagem")
                return
            }
            
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)!
                print("Atualizou imagem")
            }
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
