//
//  PanView2.swift
//  MC2
//
//  Created by YU WONGEUN on 2023/05/07.
//

import SwiftUI
import MapKit

struct PanView2: View {
    @State private var showing = false
    @Binding var tag :Int

    var body: some View {
        
        ZStack {
            MapView()
            
            Color.black.opacity(showing ? 0 : 0.7)
                .edgesIgnoringSafeArea(.all)
            
            if showing == false {
                Text("지도를\n이동해봐요!")
                    .font(.system(size: 48,weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .offset(y: -200)
                
                Image("PanArrow")
                    .resizable()
                    .frame(width: 230,height: 230)
            }
            
            VStack {
                
                Spacer()
                Button {
                    tag += 1
                } label: {
                    Text("처음으로")
                }
                .btnStyle()
            }
            
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    showing = true
                }
            }
        }
        
    }
}
