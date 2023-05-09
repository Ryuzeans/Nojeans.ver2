//
//  RotationView2.swift
//  MC2
//
//  Created by YU WONGEUN on 2023/05/02.
//

import SwiftUI

struct RotationView2: View {
    
    @State private var currentAmount = Angle.degrees(180)
    @State private var finalAmount = Angle.zero
    @State private var revolving = false
    @State private var showingSuccess = false
    
    var body: some View {
        
        ZStack {
            
            if showingSuccess {
                VStack {
                    
                    Text("잘하셨어요!\n")
                        .font(.system(size: 36,weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Image("RotationOn")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(45)
                    
                }
            } else {
                VStack {
                    
                    Text("회전을 시켜\n제 마음을 확인해봐요!")
                        .font(.system(size: 36,weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Image("RotationOff")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(45)
                    .rotationEffect(currentAmount + finalAmount)
                }
            }
        }
        .gesture(
            RotationGesture()
                .onChanged { angle in
                    currentAmount = angle
                }
                .onEnded { angle in
                    finalAmount += currentAmount
                    currentAmount = .zero
                    if (finalAmount.degrees < -175 || finalAmount.degrees > 175) {
                        withAnimation(.easeOut(duration: 0.5)) {
                            showingSuccess = true
                        }
                    } else {
                        showingSuccess = false
                    }
                })
    }
}

struct RotationView2_Previews: PreviewProvider {
    static var previews: some View {
        RotationView2()
    }
}
