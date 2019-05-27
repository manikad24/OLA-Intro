//
//  LaunchVC.swift
//  OLA
//
//  Created by Manikadan on 17/09/18.
//  Copyright © 2018 Mani. All rights reserved.
//

import UIKit

class LaunchVC: UIViewController {
    @IBOutlet var pinImage: UIImageView!
    @IBOutlet var shadowImage: UIImageView!

    override func viewDidLoad() {
        pinImage.center = self.view.center
        shadowImage.setX(x: pinImage.centerX)
        shadowImage.setY(y: pinImage.YMax - shadowImage.height)
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.jumpAnimation()
        }
        // Do any additional setup after loading the view.
    }
    
    func jumpAnimation(){
        let orrginalY = self.pinImage.y
        UIView.animate(withDuration: 1.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [.curveEaseInOut, .repeat], animations: {
            UIView.setAnimationRepeatCount(5)
            self.pinImage.setY(y: self.pinImage.y - 20)
            self.shadowImage.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { (iscompleted) in
            self.pinImage.setY(y: orrginalY)
             self.shadowImage.transform = CGAffineTransform.identity
        }
    }


}
