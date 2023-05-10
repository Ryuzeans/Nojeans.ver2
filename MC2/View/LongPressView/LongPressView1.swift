//
//  LongPressView1.swift
//  MC2
//
//  Created by Lee Jinhee on 2023/05/10.
//

import SwiftUI

struct LongPressView1: View {
    @State var firstNaviLinkActive: Bool = false
    @State var buttonActive: Bool = false
    @State private var showingPopover = false
    
    @GestureState var  isUpdating = false
    @Binding var selection: Int
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    VStack {
                        Text("아래 원을\n1초간\n눌러 볼까요?")
                            .font(.customTitle())
                            .multilineTextAlignment(.center)
                            .padding(.top, 192)
                        Spacer()
                        Image("PanCircle")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding(.bottom, 180)
                        
                            .gesture(
                                LongPressGesture(minimumDuration: 1.0)
                                    .updating($isUpdating, body: {currentState, gestureState, transaction in
                                        gestureState = currentState
                                    })
                                    .onEnded{ value in
                                        buttonActive = true
                                        showingPopover.toggle()
                                    }
                            )
                    }
                    if showingPopover {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 92, height: 92)
                            .padding(30)
                            .background(.gray)
                            .cornerRadius(30)
                            .padding(.bottom, -50)
                    }
                }
                
                if buttonActive {
                    Button {
                        selection = 2
                    } label: {
                        Text("Next")
                            .font(.customNextButton())
                            .foregroundColor(Color.white)
                    }.btnStyle().padding()
                    
                }
                else {
                    Button {
                    } label: {
                        Text("")
                            .font(.customNextButton())
                    }.padding()
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct LongPressView1_Previews: PreviewProvider {
    static var previews: some View {
        LongPressView1(selection: .constant(1))
    }
}
