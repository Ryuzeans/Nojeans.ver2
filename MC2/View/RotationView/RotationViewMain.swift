//
//  RotationViewMain.swift
//  MC2
//
//  Created by YU WONGEUN on 2023/05/09.
//

import SwiftUI

struct RotationViewMain: View {
    @State private var tag: Int = 0
    var body: some View {
        ZStack {
            switch tag {
            case 0:
                RotationView0(tag: $tag)
            case 1:
                RotationView1(tag: $tag)
            case 2:
                RotationView2(tag: $tag)
            case 3:
                RotationView3(tag: $tag)
            default:
                RotationView0(tag: $tag)
            }
            
        }
    }
}
    

struct RotationViewMain_Previews: PreviewProvider {
    static var previews: some View {
        RotationViewMain()
    }
}
