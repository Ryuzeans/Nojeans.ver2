//
//  SwiftUIView.swift
//  MC2
//
//  Created by 하명관 on 2023/05/10.
//

import SwiftUI

struct DoubleTapView4: View {
    
    @State private var isZoomed = false
    @State private var scale: CGFloat = 1.0
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            
            Image("sample")
                .resizable()
                .scaleEffect(scale)
                
                .gesture(
                    TapGesture(count: 2)
                        .onEnded{ _ in
                            withAnimation(.linear) {
                                if isZoomed {
                                    scale -= 1.5
                                } else {
                                    scale += 1.5
                                }
                                isZoomed.toggle()
                            }
                        })
                .frame(height: 400)
            
            Text("두 번 눌러볼까요?")
                .font(.customTitle())
                .frame(height: 132)
                .frame(maxWidth: .infinity)
                .foregroundColor(.black)
                .background(Color.white)
                .padding(.bottom,520)
                .opacity(isZoomed ? 0 : 1)
            
            VStack(spacing: 0) {
                
                Spacer()
                
                Button("처음으로") {
                    dismiss()
                }
                .btnStyle()
                .padding(.horizontal,16)
                .opacity(isZoomed ? 1 : 0)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DoubleTapView()
    }
}

