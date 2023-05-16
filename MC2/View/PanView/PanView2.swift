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
    @State private var btnShowing = false
    
    @Environment(\.dismiss) private var dismiss


    var body: some View {
        
        ZStack {
            MapView()
                .ignoresSafeArea()
                .gesture(
                    DragGesture(minimumDistance: 10)
                        .onChanged{ value in
                                btnShowing = true
                        })
            
            Color.black.opacity(showing ? 0 : 0.7)
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)
            
            if showing == false {
                Text("지도를\n이동해봐요!")
                    .font(Font.customTitle())
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .offset(y: -200)
                
                Image("PanArrow")
                    .resizable()
                    .frame(width: 230,height: 230)
            }
            
            VStack {
                
                Spacer()
                
                if btnShowing {
                    Button(action: {
                        tag += 1
                    }, label: {Text("완료").font(Font.customNextButton()).kerning(2)}).btnStyle()
                        .padding(16)
                }

            }
            
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    showing = true
                }
            }
        }
        
    }
}


