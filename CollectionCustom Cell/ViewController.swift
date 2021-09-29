//
//  ViewController.swift
//  CollectionCustom Cell
//
//  Created by Sergey on 28.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var images = [UIImage]()
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        
        // здесь лежат все наши картинки массив заполнили !!!
        for i in 0...9 {
            let image = UIImage(named: "image\(i)")!
            images.append(image)
        }
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        let image = images[indexPath.item]
        
        cell.imageView.image = image
        
        
       return cell
    }
   
}
