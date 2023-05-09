//
//  RotationView1.swift
//  MC2
//
//  Created by YU WONGEUN on 2023/05/02.
//

import SwiftUI

struct RotationView1: View {
    @State private var revolving = false
    
    var body: some View {
        VStack {
            
            Text("움직이는 \n두 개의 원처럼 \n두 손가락으로 \n화면을 돌려봐요 !")
                .font(.system(size: 36,weight: .bold))
                .multilineTextAlignment(.center)
            
            Image("RotationEx")
                .resizable()
                .scaledToFit()
                .rotationEffect(.degrees(revolving ? 180 : 360))
                .animation(.easeInOut(duration: 5).repeatForever(autoreverses: false), value: revolving)
                .onAppear {
                    revolving.toggle()
                }
                .offset(x: 20, y: 50)
            
        }
        //        GeometryReader { geo in
        //            VStack(alignment: .center) {
        //
        //                Text("움직이는 \n두 개의 원처럼 \n두 손가락으로 \n화면을 돌려봐요 !")
        //                    .font(.system(size: 36,weight: .bold))
        //                    .multilineTextAlignment(.center)
        //
        //                Image("RotationEx")
        //                    .resizable()
        //
        //
        ////                VStack (spacing: 50){
        ////                    ZStack {
        ////                        ZStack {
        ////                            Image("TapCircle")
        ////                                .resizable()
        ////                                .frame(width: geo.size.width / 5, height: geo.size.width / 5)
        ////                                .rotationEffect(.degrees(revolving ? -360 : 360))
        ////                                .offset(x: 60, y: -80)
        ////
        ////                            Image("TapCircle")
        ////                                .resizable()
        ////                                .frame(width: geo.size.width / 5, height: geo.size.width / 5)
        ////                                .rotationEffect(.degrees(revolving ? -360 : 360))
        ////                                .offset(x: -60, y: 80)
        ////                        }
        ////                        .rotationEffect(.degrees(revolving ? -360 : 360))
        ////                        .animation(.easeInOut(duration: 5).repeatForever(autoreverses: false), value: revolving)
        ////                        .onAppear {
        ////                            revolving.toggle()
        ////                        }
        ////                    }
        ////                }
        //
        //
        //            }
        //            .frame(width: geo.size.width, height: geo.size.height)
        //        }
    }
}

struct RotationView1_Previews: PreviewProvider {
    static var previews: some View {
        RotationView1()
    }
}
