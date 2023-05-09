//
//  PanView0.swift
//  MC2
//
//  Created by YU WONGEUN on 2023/05/07.
//

import SwiftUI

struct PanView0: View {
    @State private var position: CGSize = .zero
    var body: some View {
        
        let drag = DragGesture(minimumDistance: 0)
            .onChanged { gesture in
                self.position = gesture.translation
            }
            .onEnded { gesture in
                self.position = .zero
            }
        
        ZStack {
            VStack {
                Text("화면 움직이기\n입니다.")
                    .font(.system(size: 48,weight: .bold))
                    .multilineTextAlignment(.center)
                
                ZStack {
                    
                    Image("PanArrow")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 304, height: 304)
                    
                    Image("PanCircle")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .offset(x: position.width, y: position.height)
                        .gesture(drag)
                }
                
                Text("상하좌우로\n움직일 수 있어요.")
                    .font(.system(size: 36, weight: .light))
                    .foregroundColor(Color(UIColor.lightGray))
                    .multilineTextAlignment(.center)
                
            }
        }
    }
}

struct PanView0_Previews: PreviewProvider {
    static var previews: some View {
        PanView0()
    }
}
