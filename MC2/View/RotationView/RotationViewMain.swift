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
        
        switch tag {
        case 0:
            RotationView0()
        case 1:
            RotationView1()
        case 2:
            RotationView2()
        case 3:
            RotationView3()
        default:
            RotationView0()
        }
    }
}
    

struct RotationViewMain_Previews: PreviewProvider {
    static var previews: some View {
        RotationViewMain()
    }
}
