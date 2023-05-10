//
//  MainView.swift
//  MC2
//
//  Created by 하명관 on 2023/05/07.
//

import SwiftUI

struct TouchGesture: Identifiable,Hashable{
    let name: String
    let id = NSUUID().uuidString
}

struct MainView: View {
    
    let brands: [TouchGesture] = [
        .init(name: "길게 누르기"),
        .init(name: "두 번 누르기"),
        .init(name: "나침반"),
        .init(name: "끌어오기"),
        .init(name: "살짝 쓸기"),
        .init(name: "확대, 축소하기"),
        .init(name: "회전하기"),
    ]
    
    @State private var navigationPath = [TouchGesture]()
    
    @State private var showFullStack = false
    
    
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                VStack(alignment: .leading,spacing: 0) {
                    ScrollView{
                        ForEach(brands) { brand in
                            NavigationLink(value: brand) {
                                Text(brand.name)
                                    .font(.system(size: 40))
                                    .fontWeight(.black)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .frame(height: 196)
                                    .background(Color.orange)
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .cornerRadius(15)
                            }
                        }
                    }
                    .navigationTitle("메인")
                    .padding(.horizontal,16)
                    .navigationDestination(for: TouchGesture.self) { brand in
                        VStack{
    //                        Button {
    //                            navigationPath = []
    //                        } label: {
    //                            HStack(spacing: 5) {
    //
    //                                Image(systemName: "chevron.backward")
    //                                    .frame(width: 6, height: 11)
    //                                    .foregroundColor(.pink)
    //
    //                                Text("처음으로")
    //                                    .font(.system(size: 16))
    //                                    .foregroundColor(.pink)
    //
    //                                Spacer()
    //
    //                                Text("\(brand.name)")
    //                                    .font(.system(size: 17))
    //                                    .fontWeight(.black)
    //                                    .foregroundColor(.gray)
    //
    //                                Spacer()
    //
    //                                Spacer()
    //
    //
    //                            }
    //                            .frame(maxWidth: .infinity,alignment: .leading)
    //                            .padding(.horizontal,16)
    //                            .padding(.vertical,20)
    //                            .background(Color.gray.opacity(0.4))
    //
    //                        }
                            viewForBrand(brand)
                            
                            
                            
                        }
                    }
                }
            }
        }.accentColor(.red)
        
        
    }
    func viewForBrand(_ brand: TouchGesture) -> AnyView {
        switch brand.name {
        case "길게 누르기":
            return AnyView(Color.gray)
        case "두 번 누르기":
            return AnyView(DoubleTapView())
        case "나침반":
            return AnyView(PanViewMain())
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
