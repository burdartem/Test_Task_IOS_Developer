//
//  HeaderImageCell.swift
//  Test_Task_IOS_Developer
//
//  Created by Артем on 10/03/17.
//  Copyright © 2017 Artem. All rights reserved.
//

import UIKit

class HeaderImageCell: UITableViewCell {

    @IBOutlet weak var circle: UIView!
    @IBOutlet weak var crowns: UIImageView!
    
    @IBInspectable
    var scale: CGFloat = 0.90 { didSet{ setNeedsDisplay() } }
    
    private var radiousOval: CGFloat{
        return min(circle.bounds.size.width, circle.bounds.size.height)/2 * scale
    }
    private var centerOval: CGPoint{
        return CGPoint(x: circle.bounds.midX, y: circle.bounds.midY)
    }
    /*
     
    private var skulCenter: CGPoint{
     
    return CGPoint(x: circle.bounds.midX + circle.bounds.size.width/5.5 , y: circle.bounds.midY)
     }
     
    func animateOval() {
        
        let ovalStartAngle = CGFloat(-M_PI/2)
        let ovalEndAngle = CGFloat(2*M_PI)

        let ovalPath = UIBezierPath()
        
        ovalPath.addArc(withCenter: skulCenter,
                        radius: skullRadious,
                        startAngle: ovalStartAngle,
                        endAngle: ovalEndAngle, clockwise: true)
        
        let progressLine = CAShapeLayer()
        progressLine.path = ovalPath.cgPath
        progressLine.strokeColor = UIColor(red: 255/255, green: 190/255, blue: 61/255, alpha: 1.0).cgColor
        progressLine.fillColor = UIColor.clear.cgColor
        progressLine.lineWidth = 10.0
        progressLine.lineCap = kCALineCapRound
        
        self.contentView.layer.addSublayer(progressLine)
        
        let animateStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
        animateStrokeEnd.duration = 3.0
        animateStrokeEnd.fromValue = 0.0
        animateStrokeEnd.toValue = 1.0
        
        progressLine.add(animateStrokeEnd, forKey: "animate stroke end animation")
    }
    */
    
    func animateOval(){
        
        let gradientRingLayer = GraintCircleLayer(bounds: CGRect(origin: CGPoint.zero,size:CGSize(width: circle.bounds.width*1.1, height: circle.bounds.height*1.1)),
                                                  position:centerOval,
                                                  fromColor:UIColor(red: 255/255, green: 240/255, blue: 61/255, alpha: 1.0),
                                                  toColor:UIColor(red: 255/255, green: 170/255, blue: 61/255, alpha: 1.0),
                                                  linewidth:10.0,
                                                  toValue:0)
        circle.layer.addSublayer(gradientRingLayer)
        let duration = 3.0
        gradientRingLayer.animateCircleTo(duration: duration, fromValue: 0, toValue: 0.99)
    }
    
}
