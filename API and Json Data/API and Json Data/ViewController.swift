//
//  ViewController.swift
//  API and Json Data
//
//  Created by Chaitanya Soni on 08/02/25.
//

import UIKit

class CatTableViewCell: UITableViewCell {
    @IBOutlet weak var aspectRatio: NSLayoutConstraint!
    
    @IBOutlet weak var catImageView: UIImageView!
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var catImages: CatImages? = nil {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        //https://api.thecatapi.com/v1/images/search?limit=10
        
        let urlString = "https://api.thecatapi.com/v1/images/search?limit=10"
        
        guard let url = URL(string: urlString)
        else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self else { return }
            
            if let response = response as? HTTPURLResponse,
               response.statusCode == 200,
               let data = data {
                
                do {
                    let catImages: CatImages = try JSONDecoder().decode(CatImages.self, from: data)
                    self.catImages = catImages
                } catch {
                    print(error)
                    
                }
                
            } else if error != nil {
                
            } else {
                
            }
            
        }.resume()
        
        
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.catImages?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catCell") as! CatTableViewCell
        
        let catElement = catImages?[indexPath.row]
        
//        cell.imageViewWidth.constant = CGFloat(catElement?._width ?? 10)
//        cell.imageViewHeight.constant = CGFloat(catElement?._height ?? 10)
        cell.catImageView.image = nil
        if let imageURL = catElement?._url, let url = URL(string: imageURL) {
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
//                print(data, response, error)
                
                if let data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.catImageView.image = image
                    }
                }
            }.resume()
        }
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
