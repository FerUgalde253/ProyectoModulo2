//
//  DetailViewController.swift
//  FirstViewController
//
//  Created by Fernando Ugalde on 06/07/23.
//

import UIKit

class DetailViewController: UIViewController {

    var wineContent : UIView?
    var wineName : UILabel?
    var wineCountry : UILabel?
    var wineGrape : UILabel?
    var wineImage : UIImageView?
    var wineDescription : UILabel?
    var wineTemp : UILabel?
    
    var wine:Wine?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()

        
    }
    init(wine: Wine?){
        self.wine = wine
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .ligtColor1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI(){
        
        wineContent = UIView(frame: CGRect(x: Constants.padding, y: Constants.padding, width: Constants.width - (Constants.padding*2), height: (Constants.height) - Constants.padding*5))
        wineContent?.backgroundColor = .ligtColor2
        wineContent?.layer.cornerRadius = 10
        view.addSubview(wineContent!)
        
        wineImage = UIImageView(frame: CGRect(x: (Constants.width/2)-90, y: 15, width: 120, height: 170))
        wineImage?.image = UIImage(named: wine?.cover ?? "logo")
        wineImage?.layer.cornerRadius = 10
        wineContent?.addSubview(wineImage!)
        
        wineName = UILabel(frame: CGRect(x: 0, y: 200, width: Constants.width - Constants.padding*2, height: 40))
        wineName?.text = wine?.name
        wineName?.textAlignment = .center
        wineName?.font = UIFont(name: "Georgia", size: 30)
        wineContent?.addSubview(wineName!)
        
        wineDescription = UILabel(frame: CGRect(x: Constants.padding, y: (wineName?.frame.maxY ?? 0) + 20, width: Constants.width - Constants.padding*4, height: 250))
        wineDescription?.text = wine?.description
        wineDescription?.numberOfLines = 0
        wineDescription?.textAlignment = .justified
        wineDescription?.font = UIFont(name: "Georgia", size: 15)
        wineContent?.addSubview(wineDescription!)
        
        print(wineDescription?.frame.maxY ?? 0)
        
        wineCountry = UILabel(frame: CGRect(x: Constants.padding, y: (wineDescription?.frame.maxY ?? 0) + 5, width: Constants.width - Constants.padding, height: 20))
        wineCountry?.text = wine?.country
        wineCountry?.textAlignment = .left
        wineCountry?.font = UIFont(name: "Georgia", size: 15)
        wineContent?.addSubview(wineCountry!)
        
        wineGrape = UILabel(frame: CGRect(x: Constants.padding, y: (wineCountry?.frame.maxY ?? 0) + 5, width: Constants.width - Constants.padding, height: 20))
        wineGrape?.text = wine?.grape
        wineGrape?.textAlignment = .left
        wineGrape?.font = UIFont(name: "Georgia", size: 15)
        wineContent?.addSubview(wineGrape!)
        
        wineTemp = UILabel(frame: CGRect(x: Constants.padding, y: (wineGrape?.frame.maxY ?? 0) + 5, width: Constants.width - Constants.padding, height: 20))
        wineTemp?.text = "\(String(wine?.temp ?? 0)) °C"
        wineTemp?.textAlignment = .left
        wineTemp?.font = UIFont(name: "Georgia", size: 15)
        wineContent?.addSubview(wineTemp!)
        

    }
    
}
