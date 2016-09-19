//
//  ScrollView.swift
//  fasionshopfull
//
//  Created by do duy hung on 18/09/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//

import UIKit

class ScrollView: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    
    @IBOutlet weak var labelprice: UILabel!
    @IBOutlet weak var labelGunName: UILabel!
    
    var pageImages : [String] = []
    var photo : [UIImageView] = []
    var frontScrollViews : [UIScrollView] = []
    var first : Bool = false
    var currentPage : Int = 0
    var price : [String] = []
    var nameGun : [String] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        pageController.currentPage = currentPage
        labelprice.text = price[currentPage]
        labelGunName.text = nameGun[currentPage]
        labelprice.textColor = UIColor.redColor()
        labelGunName.textColor = UIColor.purpleColor()
        pageController.numberOfPages = pageImages.count
        //scrollView.minimumZoomScale = 0.5
        //scrollView.maximumZoomScale = 2
        //print(pageImages.count)
        let homeBut = UIBarButtonItem(image: UIImage(named: "HOME"), style: .Plain, target: self, action: Selector("backHome"))
        navigationItem.rightBarButtonItem = homeBut
    }
    func backHome(){
        let rootView = storyboard?.instantiateViewControllerWithIdentifier("ShopView")
        self.navigationController?.pushViewController(rootView!, animated: true)
    }
    func setupNew(){
        if (!first){
            first = true
            let pagesScrollViewSize = scrollView.frame.size
            scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * CGFloat(pageImages.count), 0)
            scrollView.contentOffset = CGPointMake(CGFloat(currentPage) * scrollView.frame.size.width, 0)
            
            //show image
            for (var i = 0 ; i < pageImages.count; i++){
                let imgView = UIImageView(image:UIImage(named: pageImages[i]))
                
                imgView.frame = CGRectMake(CGFloat(i) * scrollView.frame.size.width,0, scrollView.frame.size.width, scrollView.frame.size.height)
                
                imgView.contentMode = .ScaleAspectFit
                self.scrollView.addSubview(imgView)
                
                // add tap
                addaction(imgView)
                
                
                photo.append(imgView)
                //add front
                
                addfront(i, imgView: imgView)
                // add frontScroll
                
                self.scrollView.addSubview(imgView)
                scrollView.pagingEnabled = true
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        setupNew()
    }
    
    // them front
    func addfront(i : Int, imgView : UIImageView){
        let frontScrollView = UIScrollView(frame: CGRectMake(CGFloat(i) * scrollView.frame.size.width,0,scrollView.frame.size.width,scrollView.frame.size.height))
        frontScrollView.minimumZoomScale = 1
        frontScrollView.maximumZoomScale = 2
        frontScrollView.delegate = self
        frontScrollView.contentSize = imgView.bounds.size
        
        frontScrollViews.append(frontScrollView)
        self.scrollView.addSubview(frontScrollView)
    }
    
    // them tap
    func addaction(imgView: UIImageView){
        imgView.multipleTouchEnabled = true;
        imgView.userInteractionEnabled = true;
        let tap = UITapGestureRecognizer(target: self, action: Selector("tapImg:"))
        tap.numberOfTapsRequired = 1
        imgView.addGestureRecognizer(tap)
        let doubleTap = UITapGestureRecognizer(target: self, action: Selector("doubleTabImg:"))
        doubleTap.numberOfTapsRequired = 2
        imgView.addGestureRecognizer(doubleTap)
        tap.requireGestureRecognizerToFail(doubleTap)
    }
    
    func tapImg(gesture: UITapGestureRecognizer)
    {
        let position = gesture.locationInView(photo[pageController.currentPage])
        zoomRectForScale(frontScrollViews[pageController.currentPage].zoomScale * 1.5, center: position)
    }
    func doubleTabImg(gesture: UITapGestureRecognizer)
    {
        let position = gesture.locationInView(photo[pageController.currentPage])
        zoomRectForScale(frontScrollViews[pageController.currentPage].zoomScale * 0.5, center: position)
    }
    func zoomRectForScale(scale: CGFloat, center: CGPoint)
    {
        var zoomRect = CGRect()
        let scrollViewSize = scrollView.bounds.size
        zoomRect.size.height = scrollViewSize.height / scale
        zoomRect.size.width = scrollViewSize.width / scale
        
        zoomRect.origin.x = center.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0)
        frontScrollViews[pageController.currentPage] .zoomToRect(zoomRect, animated: true)
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
        return photo[pageController.currentPage]
    }
    
    @IBAction func OnChange(sender: UIPageControl) {
        
        self.scrollView.contentOffset = CGPointMake(CGFloat(pageController.currentPage) * scrollView.frame.size.width, 0)
        labelGunName.text = nameGun[pageController.currentPage]
        labelprice.text = price[pageController.currentPage]
    }
    func scrollViewDidScroll(scrollView: UIScrollView){
        pageController.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        labelprice.text = price[pageController.currentPage]
        labelGunName.text = nameGun[pageController.currentPage]
    }
    
}
