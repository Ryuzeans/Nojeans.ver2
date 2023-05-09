//
//  RotationView3.swift
//  MC2
//
//  Created by YU WONGEUN on 2023/05/02.
//

import SwiftUI

struct RotationView3: View {
    var body: some View {
        VStack {
            Image("RotationHeart")
                .resizable()
                .frame(width: 131, height: 131)
            
            Text("수강하느라\n 고생하셨어요!\n")
                .font(.system(size: 36,weight: .bold))
                .multilineTextAlignment(.center)
            
            Text("이제\n 스마트폰 터치\n")
                .font(.system(size: 36,weight: .bold))
                .multilineTextAlignment(.center)
            
            Text("혼자서도\n 잘 할 수 있겠죠?!")
                .font(.system(size: 36,weight: .bold))
                .multilineTextAlignment(.center)
        }
    }
}

struct RotationView3_Previews: PreviewProvider {
    static var previews: some View {
        RotationView3()
    }
}
