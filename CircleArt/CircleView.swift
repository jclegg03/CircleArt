//
//  ContentView.swift
//  CircleArt
//
//  Created by Clegg, Jay on 12/6/21.
//

import SwiftUI

struct CircleView: View
{
    @State private var art: AbstractArt = AbstractArt()
    
    var body: some View
    {
        art
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        CircleView()
    }
}
