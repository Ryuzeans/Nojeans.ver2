//
//  ContentView.swift
//  MC2
//
//  Created by YU WONGEUN on 2023/05/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        IntroView()
           .overlay(SplashScreenView())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
