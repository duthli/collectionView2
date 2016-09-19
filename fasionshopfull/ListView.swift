//
//  ListView.swift
//  fasionshopfull
//
//  Created by do duy hung on 18/09/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//

import UIKit

class ListView: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var item: Item!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = item.name
        textView.text = item.content
        imgProfile.image = UIImage(named: item.nameImages[0])
        imgProfile.userInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: Selector("tapImg"))
        imgProfile.addGestureRecognizer(tap)
    }

    func tapImg(){
        pushView(0)
    }

    func pushView(index:Int){
        let listView = storyboard?.instantiateViewControllerWithIdentifier("ScrollView") as? ScrollView
        listView?.currentPage = index
        listView?.pageImages = item.nameImages
        listView?.price = item.price
        listView?.nameGun = item.nameImages
        self.navigationController?.pushViewController(listView!, animated: true)
    
    }
    
    func collectionView(collectionView: UICollectionView,numberOfItemsInSection section : Int)->Int{
        return item.nameImages.count
    }

    func collectionView(collectionView: UICollectionView,cellForItemAtIndexPath indexPath : NSIndexPath)->UICollectionViewCell{
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! Cell
        cell.kCellWidth = 60
        cell.kLabelHeight = 0
        cell.kPriceLabelHeight = 0
        cell.addSubviews(false)
        cell.imageView.contentMode = .ScaleAspectFit
        cell.imageView.image = UIImage(named: item.nameImages[indexPath.item])
        return cell
    }
    func collectionView(collectionView:UICollectionView,didSelectItemAtIndexPath indexPath : NSIndexPath){
            pushView(indexPath.item)
    }

}
