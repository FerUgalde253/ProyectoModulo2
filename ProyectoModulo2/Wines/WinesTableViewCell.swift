//
//  WinesTableViewCell.swift
//  FirstViewController
//
//  Created by Fernando Ugalde on 03/07/23.
//

import UIKit


class WinesTableViewCell: UITableViewCell {

    var wineContent : UIView?
    var wineName : UILabel?
    var wineCountry : UILabel?
    var wineGrape : UILabel?
    var wineImage : UIImageView?
    
    var wine : Wine?
    
    
    //var name: String?
    
    init(wine: Wine) {
        super.init(style: .default, reuseIdentifier: nil)
        self.wine = wine
        self.backgroundColor = .ligtColor1
        initUI()
    }
    
    func initUI(){
        
        wineContent = UIView(frame: CGRect(x: 0, y: 5, width: Constants.width - (Constants.padding*2), height: (Constants.height/7) - 15))
        wineContent?.backgroundColor = .ligtColor2
        wineContent?.layer.cornerRadius = 10
        self.addSubview(wineContent!)
        
        
        wineName = UILabel(frame: CGRect(x: 80, y: 15, width: Constants.width - Constants.padding, height: 20))
        wineName?.text = wine?.name
        wineName?.textAlignment = .left
        wineName?.font = UIFont(name: "Georgia", size: 15)
        wineContent?.addSubview(wineName!)
        
        wineCountry = UILabel(frame: CGRect(x: 80, y: 40, width: Constants.width - Constants.padding, height: 20))
        wineCountry?.text = wine?.country
        wineCountry?.textAlignment = .left
        wineCountry?.font = UIFont(name: "Georgia", size: 15)
        wineContent?.addSubview(wineCountry!)
        
        wineGrape = UILabel(frame: CGRect(x: 80, y: 65, width: Constants.width - Constants.padding, height: 20))
        wineGrape?.text = wine?.grape
        wineGrape?.textAlignment = .left
        wineGrape?.font = UIFont(name: "Georgia", size: 15)
        wineContent?.addSubview(wineGrape!)
        
        wineImage = UIImageView(frame: CGRect(x: 10, y: 15, width: 60, height: 85))
        wineImage?.image = UIImage(named: wine?.cover ?? "logo")
        wineImage?.layer.cornerRadius = 10
        self.addSubview(wineImage!)
    }
    required init?(coder: NSCoder) {
        fatalError("Init has not been implemented")
    }

}
