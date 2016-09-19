//
//  Item.swift
//  fasionshopfull
//
//  Created by do duy hung on 18/09/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String?
    var content: String?
    var nameImages: [String] = []
    var price: [String] = []
    init(name: String, content: String, nameImages: [String], price: [String])
    {
        self.name = name
        self.content = content
        self.nameImages = nameImages
        self.price = price
    }
}
