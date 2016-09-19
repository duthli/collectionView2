//
//  ViewHome.swift
//  fasionshopfull
//
//  Created by do duy hung on 18/09/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//

import UIKit

class ViewHome: UIViewController {
    var items:[Item] = []
    override func viewDidLoad() {
        var myDict : NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("items", ofType: "plist")
        {
        
            myDict = NSDictionary(contentsOfFile: path)
        
        }
        for dict in myDict!.allValues{
        
        items.append(Item(name: dict["name"] as! String, content: dict["content"] as! String, nameImages: dict["images"] as! NSArray as! [String], price: dict["price"] as! NSArray as! [String]))
        }
        navigationItem.hidesBackButton = true
    }


    func collectionView(collectionView: UICollectionView,numberOfItemsInSection section : Int)->Int{
        return items.count
    }
    func collectionView(collectionView: UICollectionView,cellForItemAtIndexPath indexPath : NSIndexPath)->UICollectionViewCell{
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! Cell
        cell.addSubviews(true)
        cell.imageView.image = UIImage(named: items[indexPath.item].nameImages[0])
        cell.nameLabel.text = items[indexPath.item].name
        cell.price.text = items[indexPath.item].price[0]
        return cell
    }
    func collectionView(collectionView:UICollectionView,didSelectItemAtIndexPath indexPath : NSIndexPath){
        let listView = storyboard?.instantiateViewControllerWithIdentifier("ListViewShop") as! ListView
        self.navigationController?.pushViewController(listView, animated: true)
        listView.item = items[indexPath.item]
        
    }
}
