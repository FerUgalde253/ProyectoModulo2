//
//  RedWineObj.swift
//  FirstViewController
//
//  Created by Fernando Ugalde on 30/06/23.
//

import Foundation

class WineObj{
    var category : [Category]?
    //var wineName : String?
    init(category: [Category]) {
        self.category = category
    }
}

class Category{
    var name : String?
    var wines : [Wine]?
    
    init(name: String?, wines: [Wine]?) {
        self.name = name
        self.wines = wines
    }
}


class Wine{
    
    var name : String?
    var country : String?
    var cellar : String?
    var grape: String?
    var cover: String?
    var description : String?
    var temp : Float?
    
    init(name: String? = nil, country: String? = nil, cellar: String? = nil, grape: String? = nil, cover: String? = nil, description: String? = nil, temp: Float? = nil) {
        self.name = name
        self.country = country
        self.cellar = cellar
        self.grape = grape
        self.cover = cover
        self.description = description
        self.temp = temp
    }
}
