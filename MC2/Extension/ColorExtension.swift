//
//  ColorExtension.swift
//  MC2
//
//  Created by YU WONGEUN on 2023/05/02.
//

import SwiftUI

extension Color {
    static let peach = Color("peach")   // 예시
    static let primaryShadow = Color.primary.opacity(0.2)
    static let background = Color(UIColor.systemGray6)
    static let secondaryText = Color(hex: "#6e6e6e") //
    static let bg = Color(hex: "#000000").opacity(0.3)
    
    // MARK: - 대사 배경 색
    // 그라데이션 없이 투명도 50%
    static let darkBack = Color(hex: "#000000")
    // start: 75% , end: 50% 흰 배경
    static let whiteBack = Color(hex: "#FFFFFF")
    // 대사 투명도 x
    static let darkFore = Color(hex: "#000000")
    static let whiteFore = Color(hex: "#FFFFFF")
    
    init(hex: String) {
        let scanner = Scanner(string: hex)  // 문자열 파서 역할을 하는 클래스
        _ = scanner.scanString("#") // scanString은 iOS 13부터 지원. "#" 문자 제거
        
        var rgb: UInt64 = 0
        // 문자열을 Int64 타입으로 변환해 rgb 변수에 저장. 변환할 수 없다면 0 을 반환
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0  // 좌측 문자열 2개 추출
        let g = Double((rgb >> 8) & 0xFF) / 255.0 // 중간 문자열 2개 추출
        let b = Double((rgb >> 0) & 0xFF) / 255.0 // 우측 문자열 2개 추출
        self.init(red: r, green: g, blue: b)
    }
}
