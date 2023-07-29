//
//  WineCollectionViewCell.swift
//  FirstViewController
//
//  Created by Fernando Ugalde on 07/07/23.
//

import UIKit

class WineCollectionViewCell: UICollectionViewCell {
    
    var imageWine: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.backgroundColor = .myButtonlColor
        imageWine = UIImageView(frame: CGRect(x: 6, y: 8, width: Constants.width/5 - 23 , height: Constants.height/9))
        imageWine?.backgroundColor = .white
        imageWine?.contentMode = .scaleAspectFit
        imageWine?.image = UIImage(named: "startImage")
        self.addSubview(imageWine!)
    }
    
    func setData(wineImage: WinesImages){
        imageWine?.image = UIImage(named: wineImage.wineImage ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


