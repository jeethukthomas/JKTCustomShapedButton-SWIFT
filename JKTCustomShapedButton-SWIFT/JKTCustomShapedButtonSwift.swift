//
//  JKTCustomShapedButtonSwift.swift
//  JKTCustomShapedButton-SWIFT
//
//  Created by Jeethu on 18/07/14.
//  Copyright (c) 2014 JKT. All rights reserved.
//

import UIKit


class JKTCustomShapedButtonSwift: UIButton {
    
    init(coder aDecoder: NSCoder!)
    {
        super.init(coder: aDecoder)
    }

    init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func isAlphaVisibleAtPoint(var point:CGPoint,var forImage image1:UIImage?)->Bool
    {
        if(image1)
        {
            var image : UIImage! = image1;
        point.x *= (self.bounds.size.width != 0) ? (image.size.width / self.bounds.size.width) : 1;
        point.y *= (self.bounds.size.height != 0) ? (image.size.height / self.bounds.size.height) : 1;

          var alpha:Float=0.0;
        if image.alphaValueAtPoint(point)
        {
            var pixelAlpha : UIColor! = image.alphaValueAtPoint(point)
            
            if pixelAlpha.getRed(nil, green: nil, blue: nil, alpha: &alpha)
            {
                
            }
            else
            {
                var pointPixelAlpha:CGColorRef=pixelAlpha.CGColor
                alpha=CGColorGetAlpha(pointPixelAlpha)
            }
            
            
        }
        
        
        
        return alpha >= 0.1
        }
        else
        {
            return false
        }
    }
    override func pointInside(point: CGPoint, withEvent event: UIEvent!) -> Bool
    {
        super.pointInside(point, withEvent: event)
        if self.isAlphaVisibleAtPoint(point, forImage: self.currentImage).getLogicValue()
        {
            return true
        }
        else if self.isAlphaVisibleAtPoint(point, forImage:self.currentBackgroundImage).getLogicValue()
        {
            return true
        }
        else
        {
            return false
        }
    }

}
