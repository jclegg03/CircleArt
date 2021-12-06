//
//  RandomCircle.swift
//  CircleArt
//
//  Created by Clegg, Jay on 12/6/21.
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

        let randRadius = randomRadius(rect, randX, randY)

        let randStart = Double.random(in: 0.0 ... 2 * Double.pi)
        let randEnd = randStart + Double.random(in: 1.0 ... 2 * Double.pi)

        circlePath.move(to: CGPoint(x: randX, y: randY))
        circlePath.addArc(center: CGPoint(x: randX, y: randY), radius: CGFloat(randRadius), startAngle: Angle(radians: randStart), endAngle: Angle(radians: randEnd), clockwise: (arc4random() % 2 == 1))
        circlePath.closeSubpath()

        return circlePath
    }

    private func randomRadius(_ rect : CGRect, _ y : Int, _ x : Int) -> Int
    {
        let radius: Int
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

        return radius
    }
}
