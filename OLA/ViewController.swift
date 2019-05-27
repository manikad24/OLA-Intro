//
//  ViewController.swift
//  OLA
//
//  Created by Mani on 14/09/18.
//  Copyright © 2018 Mani. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    var scrollView : UIScrollView!
    var city: UIImageView!
    var cloud: UIImageView!
    var firstPage: FirstpageVC!
    let imageHeight: CGFloat = 154

    override func viewDidLoad() {
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: self.view.width * 7 , height: self.view.height)
        self.view.addSubview(scrollView)
        super.viewDidLoad()
        self.updateDisplay()
        self.updateViews()
        self.view.bringSubview(toFront: scrollView)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0) {
            self.firstPage.viewcar.center = CGPoint(x: self.view.centerX, y: self.firstPage.viewcar.centerY)
            self.updatePosition(xpos: 0)
        }
        super.viewWillAppear(animated)
        
    }
    
    func updateDisplay(){
        cloud = UIImageView(frame: CGRect(x: self.view.width, y: (self.view.frame.height - imageHeight) / 2, width: self.view.frame.width * 7, height: imageHeight))
        cloud.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "clouds_424x154_"))
        cloud.contentMode = .scaleAspectFit
        self.view.addSubview(cloud)
        
        city = UIImageView(frame: CGRect(x: self.view.width, y: ((self.view.frame.height - imageHeight) / 2), width: self.view.frame.width * 7, height: imageHeight))
        city.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "city_794x154_"))
        city.contentMode = .scaleAspectFit
        self.view.addSubview(city)        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updatePosition(xpos: scrollView.contentOffset.x)
        pageControl.currentPage = (scrollView.currentPage - 1)
        self.updatePageControl()
        if scrollView.currentPage == 1{
            let rotate = (scrollView.contentOffset.x - firstPage.viewcar.centerX) * 0.2
            firstPage.imgWheelRear.transform = CGAffineTransform(rotationAngle: -rotate)
            firstPage.imgWheelFront.transform = CGAffineTransform(rotationAngle: -rotate)
        }
    }
    
    func updatePosition(xpos: CGFloat){
        let cityPos = xpos * 0.4
        let cloudPos = xpos * 0.3
        city.setX(x: -cityPos)
        cloud.setX(x: -cloudPos)
    }
    
    func updateViews(){
        
        for index in 0...6 {
            if index == 0{
                firstPage = Bundle.main.loadNibNamed("FirstpageVC", owner: self, options: nil)?.first! as! FirstpageVC
                firstPage.frame = scrollView.frame
                firstPage.backgroundColor = UIColor.clear
                firstPage.viewcar.setX(x: -firstPage.viewcar.width)
                firstPage.viewcar.setY(y: city.YMax - firstPage.viewcar.height)
                self.scrollView.addSubview(firstPage)
            }else{
                let other = Bundle.main.loadNibNamed("OtherPage", owner: self, options: nil)?.first! as! OtherPage
                other.frame = scrollView.frame
                other.setX(x: CGFloat(index) * scrollView.width)
                let yvalue = (self.view.frame.height / 2) - 327 + (imageHeight / 2)
                other.imageView.setY(y: yvalue)
                other.backgroundColor = UIColor.clear
                other.updateImage(index: index)
                self.scrollView.addSubview(other)
            }
        }
        
    }
    
    func updatePageControl() {
        for (index, dot) in pageControl.subviews.enumerated() {
            if index != pageControl.currentPage {
                dot.backgroundColor = UIColor.lightGray
                dot.layer.cornerRadius = dot.frame.size.height / 2;
            } else {
                dot.backgroundColor = UIColor.white
                dot.layer.cornerRadius = dot.frame.size.height / 2
                dot.layer.borderColor = UIColor.lightGray.cgColor
                dot.layer.borderWidth = 0.5
            }
        }
    }


}

