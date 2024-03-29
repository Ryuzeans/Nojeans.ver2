//
//  MainView.swift
//  MC2
//
//  Created by 하명관 on 2023/05/07.
//

import SwiftUI

struct TouchGesture: Identifiable,Hashable{
    let id = UUID()
    let name: String
    var image: String
    let subName: String
}

struct MainView: View {
    
    let brands: [TouchGesture] = [
        .init(name: "두 번 누르기", image: "ListColor 1", subName: "Double Tap"),
        .init(name: "길게 누르기", image: "ListColor 2", subName: "Long Tap"),
        .init(name: "살짝 쓸기", image: "ListColor 3", subName: "Swipe"),
        .init(name: "끌어오기", image: "ListColor 4", subName: "Drag"),
        .init(name: "화면 움직이기", image: "ListColor 5", subName: "Pan"),
        .init(name: "확대 축소하기", image: "ListColor 6", subName: "Zoom in, out"),
        .init(name: "회전하기", image: "ListColor 7", subName: "Rotate"),
    ]
    
    @State private var navigationPath = [TouchGesture]()
    
    @State private var showFullStack = false
    
    
    
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                VStack(alignment: .leading,spacing: 0) {
                    ScrollView(showsIndicators: false){
                        ForEach(brands) { brand in
                            NavigationLink(value: brand) {
                                
                                Rectangle()
                                    .foregroundColor(Color("\(brand.image)"))
                                    .frame(height: 115)
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(10)
                                    .padding(.horizontal,16)
                                    .shadow(radius: 4,x:0,y:0)
                                    .overlay(
                                        
                                        HStack {
                                            VStack() {
                                                
                                                Text(brand.name)
                                                    .font(.customTitle())
                                                    .foregroundColor(.white)
                                                    .frame(width: 280,alignment: .leading)
                                                
                                                Text(brand.subName)
                                                    .font(.customHeader())
                                                    .foregroundColor(.white)
                                                    .frame(width: 280,alignment: .leading)
                                                    
                                            }
                                            .padding(.leading,36)
                                            Image(systemName: "chevron.forward")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 11, height: 18)
                                                .foregroundColor(Color.white)
                                                .fontWeight(.bold)
                                                .padding(.trailing,50)
                                        }
                                        
                                    )
                                    .padding(.bottom,12)

                            }
                        }
                    }
                    .navigationTitle("Toucher")
//                    .padding(.horizontal,16)
                    .navigationDestination(for: TouchGesture.self) { brand in
                        VStack{
                            Button {
                                navigationPath = []
                            } label: {
                                HStack(spacing: 5) {
    
                                    Image(systemName: "chevron.backward")
                                        .frame(width: 6, height: 11)
                                        .foregroundColor(Color("BrandColor"))
    
                                    Text("처음으로")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color("BrandColor"))
    
                                    Spacer()
    
                                    Text("\(brand.name)")
                                        .font(.system(size: 17))
                                        .fontWeight(.black)
                                        .foregroundColor(.gray)
    
                                    Spacer()
    
                                    Spacer()
    
    
                                }
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .padding(.horizontal,16)
                                .padding(.vertical,20)
                                .background(Color("HeaderColor"))
                                
    
                            }
                            viewForBrand(brand)
                            
                            
                            
                        }
                    }
                }
            }
        }.accentColor(.red)
            .onAppear{
                 UserDefaults.standard.set(true, forKey: "goToMain")
             }
        
        
    }
    func viewForBrand(_ brand: TouchGesture) -> AnyView {
        switch brand.name {
        case "길게 누르기":
            return AnyView(LongPressMain())
        case "두 번 누르기":
            return AnyView(DoubleTapViewMain())
        case "화면 움직이기":
            return AnyView(PanViewMain())
        case "끌어오기":
            return AnyView(DragViewMain())
        case "살짝 쓸기":
            return AnyView(SwipeViewMain())
        case "확대 축소하기":
            return AnyView(ZoomViewMain())
        case "회전하기":
            return AnyView(RotationViewMain())
        default:
            return AnyView(Color.gray)
        }
    }
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
