//
//  RandomCircle.swift
//  CircleArt
//
//  Created by Plo Koon on 12/6/21.
//

import Foundation
import SwiftUI

struct RandomCircle : Shape
{
    func path(in rect : CGRect) -> Path
    {
        var circlePath = Path()

        let randX = Int(1 / 2 * rect.midX) + Int(arc4random()) % Int(rect.midX)
        let randY = Int(1 / 2 * rect.midY) + Int(arc4random()) % Int(rect.midY)

        let randRadius = randomRadius(in: rect, y: randY, x: randX)

        let randStart = Double.random(in: 0.0 ... 2 * Double.pi)
        let randEnd = randStart + Double.random(in: 1.0 ... 2 * Double.pi)

        circlePath.move(to: CGPoint(x: randX, y: randY))
        circlePath.addArc(center: CGPoint(x: randX, y: randY), radius: CGFloat(randRadius), startAngle: Angle(radians: randStart), endAngle: Angle(radians: randEnd), clockwise: (arc4random() % 2 == 1))
        circlePath.closeSubpath()

        return circlePath
    }

    private func randomRadius(in rect : CGRect, y: Int, x: Int) -> Int
    {
        let minRadius: Int = 20
        let maxRadius: Int = Int(rect.midX / 2)
        var radius: Int
        let smaller : Int

        if(abs(x - Int(rect.midX)) < abs(y - Int(rect.midY)))
        {
            smaller = abs(x - Int(rect.midX))
        }
        else
        {
            smaller = abs(y - Int(rect.midY))
        }

        radius = Int(arc4random()) % (smaller + 1)
        
        if(radius < minRadius)
        {
            radius = minRadius
        }
        else if(radius > maxRadius)
        {
            radius = maxRadius
        }

        return radius
    }
}
