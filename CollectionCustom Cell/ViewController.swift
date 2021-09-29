//
//  ViewController.swift
//  CollectionCustom Cell
//
//  Created by Sergey on 28.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var images = [UIImage]()
    
    let countCells = 2
    let offset: CGFloat = 2.0
    let cellId = "cell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        
        
        // здесь лежат все наши картинки массив заполнили !!!
        for i in 0...9 {
            let image = UIImage(named: "image\(i)")!
            images.append(image)
        }
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionViewCell
        
        let image = images[indexPath.item]
        
        cell.imageView.image = image
        
        
       return cell
    }
    
    // размеры в ячейках
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frameCV = collectionView.frame
        
        let withCell = frameCV.width / CGFloat(countCells)
        let heightCell = withCell
        
        
        
        let spacing = CGFloat((countCells + 1)) * offset / CGFloat(countCells)
        
        
        return CGSize(width: withCell - spacing, height: heightCell - (offset * 2))
    }
   
}


