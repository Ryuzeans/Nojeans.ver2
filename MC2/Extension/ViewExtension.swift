//
//  ViewExtension.swift
//  MC2
//
//  Created by YU WONGEUN on 2023/05/09.
//

import Foundation
import SwiftUI

struct BtnStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth:.infinity)
            .frame(height: 58)
            .font(.headline)
            .padding(.horizontal, 16)
            .foregroundColor(.white)
            .background(Color("BrandColor"))
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct BtnWhiteStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth:.infinity)
            .frame(height: 58)
            .font(.headline)
            .padding(.horizontal, 16)
            .foregroundColor(Color("BrandColor"))
            .background(.white)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("BrandColor"), lineWidth: 0.5))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

extension View {
    func btnStyle() -> some View {
        self.buttonStyle(BtnStyle())
    }
    
    func btnWhiteStyle() -> some View {
        self.buttonStyle(BtnWhiteStyle())
    }
    
}
