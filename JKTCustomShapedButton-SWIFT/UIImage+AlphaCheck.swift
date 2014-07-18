//
//  UIImage+AlphaCheck.swift
//  JKTCustomShapedButton-SWIFT
//
//  Created by Jeethu on 18/07/14.
//  Copyright (c) 2014 JKT. All rights reserved.
//

import UIKit

extension UIImage {

    func alphaValueAtPoint(var point:CGPoint)->UIColor?
    {
        if !CGRectContainsPoint(CGRectMake(0, 0, self.size.width, self.size.height), point)
        {
            return nil
        }
        
        var pointX : Float = point.x
        var pointY : Float = point.y
        
        var cgImage : CGImageRef  = self.CGImage;
        var width : Float = self.size.width;
        var height : Float = self.size.height;
        var colorSpace :CGColorSpaceRef = CGColorSpaceCreateDeviceRGB();
        var bytesPerPixel : UInt = 4;
        var bytesPerRow : UInt = bytesPerPixel * 1;
        var bitsPerComponent : UInt = 8;
       
        var fl : Float[] = [0,0,0,0]
        var pixelData: CMutablePointer<Float> = &fl
        
        let bitmapInfo = CGBitmapInfo.fromRaw(CGImageAlphaInfo.PremultipliedLast.toRaw())!
        
        let context : CGContext? = CGBitmapContextCreate(nil, 1, 1, bitsPerComponent, bytesPerRow,colorSpace, CGBitmapInfo.AlphaInfoMask)
//        CGColorSpaceRelease(colorSpace);
        
        CGContextSetBlendMode(context, kCGBlendModeCopy);
        CGContextTranslateCTM(context, -pointX, pointY-Float(height));
        CGContextDrawImage(context, CGRectMake(0.0, 0.0, Float(width), Float(height)), cgImage);
        CGContextRelease(context);
        let red : CGFloat   = Float(fl[0]) / 255.0;
        let green : CGFloat = CGFloat(fl[1]) / 255.0;
        let blue : CGFloat = CGFloat(fl[2]) / 255.0;
        let alpha : CGFloat = CGFloat(fl[3]) / 255.0;
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        
        

    }

}