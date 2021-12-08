//
//  ContentView.swift
//  CircleArt
//
//  Created by Aayla Secura on 12/6/21.
//

import SwiftUI

struct CircleView: View
{
    @State private var art: AbstractArt = AbstractArt()
    
    var body: some View
    {
        art
            .background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        CircleView()
    }
}
