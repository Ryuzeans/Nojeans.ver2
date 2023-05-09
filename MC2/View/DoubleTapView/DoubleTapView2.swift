//
//  DoubleTapView2.swift
//  MC2
//
//  Created by YU WONGEUN on 2023/05/02.
//

import SwiftUI

struct DoubleTapView2: View {
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .center, spacing: geo.size.width / 3) {
                Text("두 번 \n눌러볼까요?")
                    .font(.system(size: geo.size.width / 11).weight(.bold))
                    .multilineTextAlignment(.center)
                
                Image("TapCircle")
                    .resizable()
                    .frame(width: geo.size.width / 3, height: geo.size.width / 3)
                    .onTapGesture(count: 2) {
                        print("sd")
                    }
                    
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct DoubleTapView2_Previews: PreviewProvider {
    static var previews: some View {
        DoubleTapView2()
    }
}
