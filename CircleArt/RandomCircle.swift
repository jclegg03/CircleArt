//
//  RandomCircle.swift
//  CircleArt
//
//  Created by Clegg, Jay on 12/6/21.
//

import Foundation

struct Circle() : Shape
{
    func path(in rect : CGRect) -> Path
    {
        var circlePath = Path()
        
        let randX = Int(1 / 2 * rect.midX + arc4random() % rect.midX)
        let randY = Int(1 / 2 * rect.midY + arc4random() % rect.midY)
        
        let randRadius: Int
        if(randX > randY)
        {
            randRadius = Int.random(in: 1 ..< randY)
        }
        else
        {
            randRadius = random(in: 1 ..< randX)
        }
        
        let randStart = Double.random(in: 0.0 ... 2 * Double.pi)
        let randEnd = randStart + Double.random(in: 1.0 ... 2 * Double.pi)
        
        circlePath.move(to: CGPoint(x: randX, y: randY))
        circlePath.addArc(center: CGPoint(x: randX, y: randY), radius: randRadius, startAngle: Angle(radians: randStart), endAngle: Angle(radians: randEnd), clockwise: (arc4random() % 2 == 1))
        circlePath.closeSubpath()
        
        return circlePath
    }

    private func randomRadius() -> Int
    {
        let radius: Int
        let smaller : Int
        
        if(abs(x - rect.midX) < abs(y - rect.midY))
        {
            smaller = abs(x - rect.midX)
        }
        else
        {
            smaller = abs(y - rect.midY)
        }
        
        radius = Int(arc4random % smaller)
        
        return radius
    }
}
