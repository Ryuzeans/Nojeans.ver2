//
//  CustomButton.swift
//  MC2
//
//  Created by 하명관 on 2023/05/10.
//

import SwiftUI

struct CustomButton: View {
    var body: some View {
        VStack{
            Image("Image2")
                .resizable()
                .scaledToFit()
                .overlay(
                    Text("길게 누르기")
                        .font(.customTitle())
                        .foregroundColor(.white)
                        .padding(.leading,20)
                        .frame(maxWidth: .infinity,alignment: .leading)
                )
            
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton()
    }
}
