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
            .frame(height: 48)
            .font(.headline)
            .padding(.horizontal, 16)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

extension View {
    func btnStyle() -> some View {
        self.buttonStyle(BtnStyle())
    }
}
