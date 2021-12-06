//
//  AbstractArt.swift
//  CircleArt
//
//  Created by Clegg, Jay on 12/6/21.
//

import SwiftUI

struct AbstractArt: View
{
    @State var circles =
        [
            RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(),
            RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), //10
            RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(),
            RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), //20
            RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(),
            RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), //30
            RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(),
            RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), //40
            RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(),
            RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), //50
            RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(),
            RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), //60
            RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(),
            RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), //70
            RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(),
            RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), //80
            RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(),
            RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), //90
            RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle(),
            RandomCircle(), RandomCircle(), RandomCircle(), RandomCircle()  //100
        ]
        
    var body: some View
    {
        VStack
        {
            Button("Generate new art piece", action: randomizeCircles)
            ZStack
            {
                ForEach(circles.indices)
                {
                    index in
                    
                    if(index < circles.count)
                    {
                        circles[index]
                            .fill(randomColor())
                    }
                }
            }
        }
    }
     
    private func randomizeCircles() -> Void
    {
        
        circles.removeAll()
        for _ in 1 ... 50 + Int(arc4random() % 51)
        {
            circles.append(RandomCircle())
        }
    }
    
    private func randomColor() -> Color
    {
        let color : Color
        
        let redPercent = Double.random(in: 255.0 * 0.1 ... 255.0 * 0.9) / 255.0
        let greenPercent = Double.random(in: 255.0 * 0.1 ... 255.0 * 0.9) / 255.0
        let bluePercent = Double.random(in: 255.0 * 0.1 ... 255.0 * 0.9) / 255.0
        
        color = Color(red: redPercent, green: greenPercent, blue: bluePercent)
        return color
    }
}


struct AbstractArt_Previews: PreviewProvider
{
    static var previews: some View
    {
        AbstractArt()
    }
}
