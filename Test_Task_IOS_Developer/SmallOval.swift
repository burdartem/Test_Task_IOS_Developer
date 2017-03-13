//
//  SmallOval.swift
//  Test_Task_IOS_Developer
//
//  Created by Артем on 11/03/17.
//  Copyright © 2017 Artem. All rights reserved.
//

import UIKit

class SmallOval: UIView {
    
    @IBInspectable
    var scale: CGFloat = 0.90 { didSet{ setNeedsDisplay() } }

    private var radiousOval: CGFloat{
        return min(bounds.size.width, bounds.size.height)/2 * scale
    }
    private var centerOval: CGPoint{
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    private func pathForCircleCenteredAtPoint (midPoint: CGPoint, withRadious radious: CGFloat) -> UIBezierPath
    {
        let path = UIBezierPath(arcCenter: midPoint,
                                radius: radious,
                                startAngle: 0.0,
                                endAngle: CGFloat(2*M_PI),
                                clockwise: false)
        UIColor.white.setFill()
        path.fill()
        
        UIColor(red: 255/255, green: 220/255, blue: 61/255, alpha: 1.0).setStroke()
        path.stroke()
        
        return path
    }
    
    override func draw(_ rect: CGRect) {

        pathForCircleCenteredAtPoint(midPoint: centerOval, withRadious: radiousOval).stroke()
    
    }


}
