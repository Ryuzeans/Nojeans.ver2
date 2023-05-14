//
//  RotationView2Map.swift
//  MC2
//
//  Created by Lee Jinhee on 2023/05/14.
//

import SwiftUI
import MapKit

struct RotationView2Map: View {
    @State private var showing = false
    @Binding var tag :Int
    @State private var buttonActive = false
    var body: some View {
        VStack {
            Spacer().frame(height: 40)
            Text("지도를\n회전해 볼까요?")
                .font(Font.customTitle())
                .multilineTextAlignment(.center)
            
            ZStack(alignment: .bottom) {
                MapView()
                    .ignoresSafeArea()
                
                Color.black.opacity(showing ? 0 : 0.7)
                    .ignoresSafeArea()
                    .edgesIgnoringSafeArea(.all)
                            
                if buttonActive {
                    Button {
                        tag += 1
                    } label: {
                        Text("완료").font(.customNextButton()).kerning(2)
                    }.btnStyle().frame(height: 50).padding(16)
                }
                else {
                    Button { } label: {
                        Text("")
                    }.frame(height: 50).padding(16)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        showing = true
                    }
                }
            }
            .gesture(
                RotationGesture()
                    .onChanged { angle in
                        buttonActive = true
                    }
                    .onEnded { angle in
                        buttonActive = true
                    }
            )
        }
    }
}

struct RotationView2Map_Previews: PreviewProvider {
    static var previews: some View {
        RotationView2Map(tag: .constant(2))
    }
}
