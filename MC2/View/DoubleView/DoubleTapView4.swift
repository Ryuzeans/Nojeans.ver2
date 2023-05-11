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
//                    .scaledToFit()
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
                VStack(spacing: 0) {
                    
                    Text("두번 눌러볼까요?")
                        .font(.customTitle())
                        .frame(height: 132)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .padding(.bottom,500)
                    
                    Button("다음") {
                        dismiss()
                    }
                    .btnStyle()
                    .animation(.linear)
                    .opacity(isZoomed ? 1 : 0)
                    .padding(.vertical,50)
                    .padding(.horizontal,152)
                }
                

//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame( maxWidth:  isZoomed ? .infinity : 150)
//                            .edgesIgnoringSafeArea(.all)
//                            .onTapGesture(count: 2) {
//                                withAnimation(.interactiveSpring(response: 0.7,dampingFraction: 0.5, blendDuration: 0.5)) {
//                                    isZoomed.toggle()
//                                }
//                            }
                    
                

            }
        }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DoubleTapView4()
    }
}
