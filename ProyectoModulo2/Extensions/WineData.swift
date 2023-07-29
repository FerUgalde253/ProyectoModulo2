//
//  WinesData.swift
//  FirstViewController
//
//  Created by Fernando Ugalde on 06/07/23.
//

import Foundation

class WineData{
    
    var imageSourece : CollectionWineObject?
    var dataSource : WineObj?
    
    func getImage(){
        let malleolus = WinesImages(wineImage: "EmilioMoro")
        let singular = WinesImages(wineImage: "SINGULAR")
        let hautMedoc = WinesImages(wineImage: "CHÂTEAU BEAUMONT")
        let chateauGuiraud = WinesImages(wineImage: "CHATEAU")
        let lomita = WinesImages(wineImage: "LOMITA")
        let freixenetW = WinesImages(wineImage: "FreixenetWhite")
        let closDuTemple = WinesImages(wineImage: "ClosDuTemple")
        let whisperingAngel = WinesImages(wineImage: "WhisperingAngel")
        let freixenetR = WinesImages(wineImage: "FreixenetRose")
        
        let recent = WineCategory(name: "Top Sells", winesImages: [malleolus,singular,hautMedoc,chateauGuiraud,lomita,freixenetW,closDuTemple,whisperingAngel,freixenetR])
        
        let Wine = CollectionWineObject(wineCategory: [recent])
        
        imageSourece = Wine
    }
    
    func getData(){
        
        let wine1 = Wine(
            name: "Malleolus",
            country: "España",
            cellar: "Emilio Moro",
            grape: "Tempranillo",
            cover: "EmilioMoro",
            description: "Vino Tinto Tempranillo; Emilio Moro Malleolus de Valdeorramiro posee un color picota granate muy cubierto. En nariz su aroma es intenso y complejo. Los aromas primarios son los protagonistas, madurados y enriquecidos en matices por su crianza en madera. En boca es opulento, sedoso y de gran potencia, con un final largo y persistente. Maridaje: Caza mayor, asados y carnes rojas.",
            temp: 16)
            
            
        let wine2 = Wine(
            name: "Singular",
            country: "Mexico",
            cellar: "Hacienda La Lomita",
            grape: "Ensable",
            cover: "SINGULAR",
            description: "Vino Tinto Ensamble Singular, México; Crianza de 11 meses en barricas de roble francés y americano de primer uso. Acompaña tus reuniones con los mejores vinos que El Palacio de Hierro te ofrece.",
            temp: 18)
        let wine3 = Wine(
            name: "Haut-Médoc",
            country: "Francia",
            cellar: "Chateau Beaumont",
            grape: "Cabernet Sauvignon",
            cover: "CHÂTEAU BEAUMONT",
            description: "Vino Tinto Vino tinto Cabernet Sauvignon Château Beaumont; Notas de cata: Armonioso, afrutado, taninos sedosos y maduros, lo que revela unos ligeros toques especiados con un largo final. Añejamiento en barrica de 12 meses. De cuerpo medio.",
            temp: 16)
        
        let wine4 = Wine(
            name: "Chateau Guiraud",
            country: "Francia",
            cellar: "Chateau Guiraud",
            grape: "Sauvignon blanc",
            cover: "CHATEAU",
            description: "Vino Blanco Sémillon & Sauvignon Blanc; Château Sauternes un vino blanco de color amarillo limón que posee aromas de miel, notas de jazmín, melocotón y manzana maduros. En boca presenta una acidez media alta, con cuerpo y un final medio alto. Maridaje: Ideal con quesos roquefort, azules, semicurados, postres a base de frutas y chocolate, foie gras.",
            temp: 9)
        let wine5 = Wine(
            name: "Lomita",
            country: "Mexico",
            cellar: "Hacienda La Lomita",
            grape: "Chardonnay",
            cover: "LOMITA",
            description: "Vino Blanco Chardonnay Lomita, México; Emprendimiento vitivinícola de punta inaugurado en el marco de las fiestas de la vendimia del 2009. Atributos de Vista: Amarillo oro, brillante y cristalino, con destellos en verde. Atributos de Nariz; Flor de jazmín, miel, azúcar glass, manzana roja, kiwi, durazno, piña. Atributos de Boca: Acidez media alta, mineralidad, profundidad, buena persistencia. Maridaje: Rissotto cremoso con parmesano, pollo a la leña, huachinango a la veracruzana, ensalada de betabeles salteada con queso de cabra.",
            temp: 7)
        
        let wine6 = Wine(
            name: "Freixenet",
            country: "Italia",
            cellar: "Freixenet",
            grape: "Pinot Grigio",
            cover: "FreixenetWhite",
            description: "Vino Blanco Pinot Grigio; Freixenet Garda DOC posee un color pajo pálido con destellos dorados. En nariz es floral y delicado, con aromas frutales y sutiles notas de cítricos crujientes. En boca resulta fresco Maridaje Es perfecto para platos de mariscos y vegetarianos.",
            temp: 7)
        
        let wine7 = Wine(
            name: "Clos du Temple",
            country: "Francia",
            cellar: "Gerard Bertrand",
            grape: "Ensamble",
            cover: "ClosDuTemple",
            description: "Este rosado es una creación del vigneron Gérard Bertrand, uno de los mayores exponentes del cultivo biodinámico del sur de Francia. Las uvas que componen este coupage se vendimian al amanecer para aprovechar las bajas temperaturas y conservar todo el perfil aromático de cada racimo. El resultado es un vino fresco, elegante y mineral.",
            temp: 10)
        
        let wine8 = Wine(
            name: "Whispering Angel",
            country: "Francia",
            cellar: "Château d’Esclans",
            grape: "Ensamble",
            cover: "WhisperingAngel",
            description: "Vino Rosado Ensamble; Château d’Esclans Whispering Angel es un vino de color rosado con intensidad media y matices de salmón. En nariz posee características de frutos rojos frescos con toque floral. En boca se siente maduro y carnoso. Balanceado, jugoso con frescura.",
            temp: 7.5)
        
        let wine9 = Wine(
            name: "Freixenet",
            country: "Italia",
            cellar: "Freixenet",
            grape: "Glera",
            cover: "FreixenetRose",
            description: "Vino Rosado Glera; Freixenet Italian Rosé muestra un rosa pálido con destellos brillantes. En nariz posee un sutil aroma perfumado. En boca posee un delicado toque de cerezas y fresas.",
            temp: 7)
        
        let redWine = Category(name: "Red Wines", wines: [wine1, wine2, wine3])
        let whiteWine = Category(name: "White Wines", wines: [wine4, wine5,wine6])
        let roseWine = Category(name: "Rose Wines", wines: [wine7, wine8, wine9])
        
        let winesDB = WineObj(category: [redWine, whiteWine, roseWine])
        
        dataSource = winesDB
    }
}
