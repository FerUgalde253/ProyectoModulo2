//
//  GridViewController.swift
//  FirstViewController
//
//  Created by Fernando Ugalde on 07/07/23.
//

import UIKit

class GridViewController: UIViewController {

    var winesCollectionView: UICollectionView?
    var wineData = WineData()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.myBackGroundColor
        initUI()
        wineData.getImage()
        setConstrains()
        
        
    }
    
    func initUI(){
  
        winesCollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = Constants.width/15
            layout.minimumInteritemSpacing = Constants.width/10
            
            let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collection.register(WineCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
            collection.isPagingEnabled = true
            collection.translatesAutoresizingMaskIntoConstraints = false
            collection.backgroundColor = .clear
            collection.showsVerticalScrollIndicator = true
            collection.showsHorizontalScrollIndicator = true
            return collection
        }()
    }
    
    func setConstrains(){
        
        guard let winesCollectionView = winesCollectionView else { return }
        
        winesCollectionView.delegate = self
        winesCollectionView.dataSource = self
        view.addSubview(winesCollectionView)
        
        NSLayoutConstraint.activate([
            winesCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            winesCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            winesCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            winesCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8),
        ])
    }
}

//MARK: - CollectionView Extensions

extension GridViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //Determina el numero de celdas dependiendo de la cantidad de imagenes
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wineData.imageSourece?.wineCategory?[section].winesImages?.count ?? 0
    }
    //Asigna las imagenes a cada celda
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = winesCollectionView?.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! WineCollectionViewCell
        let winesImage = wineData.imageSourece?.wineCategory?[indexPath.section].winesImages?[indexPath.item]
        cell.setData(wineImage: winesImage!)
        return cell
    }
    //Determina la altura y anchoi de cada celda
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.width/5 - 10, height: Constants.height/6 - 30)
    }
    //Seleciona la cantidad de secciones
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
}
