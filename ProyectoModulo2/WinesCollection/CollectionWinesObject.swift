//
//  CollectionWinesObject.swift
//  FirstViewController
//
//  Created by Fernando Ugalde on 06/07/23.
//

import Foundation

class CollectionWineObject{
    var wineCategory : [WineCategory]?
    //var wineName : String?
    init(wineCategory: [WineCategory]) {
        self.wineCategory = wineCategory
    }
}

class WineCategory{
    var name : String?
    var winesImages : [WinesImages]?
    
    init(name: String?, winesImages: [WinesImages]?) {
        self.name = name
        self.winesImages = winesImages
    }
}


class WinesImages{
    
    var wineImage: String?
   
    init(wineImage: String?) {
        self.wineImage = wineImage
    }
}

