//
//  OtherPage.swift
//  OLA
//
//  Created by Manikadan on 14/09/18.
//  Copyright © 2018 Mani. All rights reserved.
//

import UIKit

class OtherPage: UIView {
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var imageView: UIImageView!

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func updateImage(index: Int){
        switch index {
        case 1:
            imageView.image = #imageLiteral(resourceName: "2-splash-image_320x325_")
            lblTitle.text = "Pick your preference and book for now or later"
            
        case 2:
            imageView.image = #imageLiteral(resourceName: "3-splash-image_320x325_")
            lblTitle.text = "Know where your ride is by tracking in real time"
            
        case 3:
            imageView.image = #imageLiteral(resourceName: "4-splash-image_320x325_")
            lblTitle.text = "Share ride details to let your folks know you're safe"
            
        case 4:
            imageView.image = #imageLiteral(resourceName: "3-splash-image_320x325_")
            lblTitle.text = "Ride cashless by recharging your Ola money wallet"
            
        case 5:
            imageView.image = #imageLiteral(resourceName: "4-splash-image_320x325_")
            lblTitle.text = "Earn free rides by inviting your friends to Ola"
            
        case 6:
            imageView.image = #imageLiteral(resourceName: "7-splash-image_320x325_")
            lblTitle.text = "Save frequent locations as favourites for quickaccess"
            
        default:
            break
        }
    }

}
