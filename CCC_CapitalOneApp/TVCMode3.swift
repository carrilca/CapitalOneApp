//
//  TVCMode3.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 9/8/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

protocol VMDelegate9:class{
    func updateImage(image: UIImage)
}

class TVCModel3 {
    
    weak var TVCModelViewController3:VMDelegate9?
    var masterArray:[Product]?
    
    init(delegateTVCModel3:VMDelegate9? = nil){
        self.TVCModelViewController3 = delegateTVCModel3
    }
    
    func getImage(url:String) {
        Networking.getImage(url: url){
            [unowned self] (error, data) in
            guard error == nil else {return}
            guard let dataIn = data else {return}
            self.TVCModelViewController3?.updateImage(image: dataIn)
        }
    }
    
}