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
            Circle(), Circle(), Circle(), Circle(), Circle(), Circle(),
            Circle(), Circle(), Circle(), Circle(), //10
            Circle(), Circle(), Circle(), Circle(), Circle(), Circle(),
            Circle(), Circle(), Circle(), Circle(), //20
            Circle(), Circle(), Circle(), Circle(), Circle(), Circle(),
            Circle(), Circle(), Circle(), Circle(), //30
            Circle(), Circle(), Circle(), Circle(), Circle(), Circle(),
            Circle(), Circle(), Circle(), Circle(), //40
            Circle(), Circle(), Circle(), Circle(), Circle(), Circle(),
            Circle(), Circle(), Circle(), Circle(), //50
            Circle(), Circle(), Circle(), Circle(), Circle(), Circle(),
            Circle(), Circle(), Circle(), Circle(), //60
            Circle(), Circle(), Circle(), Circle(), Circle(), Circle(),
            Circle(), Circle(), Circle(), Circle(), //70
            Circle(), Circle(), Circle(), Circle(), Circle(), Circle(),
            Circle(), Circle(), Circle(), Circle(), //80
            Circle(), Circle(), Circle(), Circle(), Circle(), Circle(),
            Circle(), Circle(), Circle(), Circle(), //90
            Circle(), Circle(), Circle(), Circle(), Circle(), Circle(),
            Circle(), Circle(), Circle(), Circle()  //100
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
                    
                    circles[index]
                        .fill(randomColor())
                }
            }
        }
    }
     
    private func randomizeCircles() -> Void
    {
        
        circles.removeAll()
        for _ in 1 ... 50 + Int(arc4random() % 51)
        {
            circles.append(Circle())
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
