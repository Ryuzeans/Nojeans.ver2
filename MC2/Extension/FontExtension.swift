//
//  FontExtension.swift
//  MC2
//
//  Created by Lee Jinhee on 2023/05/09.
//

import Foundation
import SwiftUI

extension Font {
    static func customTitle() -> Font {
        return Font.custom("AppleSDGothicNeo-Bold", size: 40, relativeTo: .title)
    }
    static func customEngTitle() -> Font {
        return Font.system(size: 32, weight: .regular)
    }
    static func customExplainEmphasis() -> Font {
        return Font.custom("AppleSDGothicNeo-Bold", size: 34, relativeTo: .title2)
    }
    static func customExplain() -> Font {
        return Font.custom("AppleSDGothicNeo-Medium", size: 32, relativeTo: .title3)
    }
    static func customHeader() -> Font {
        return Font.custom("AppleSDGothicNeo-Medium", size: 17, relativeTo: .subheadline)
    }
    static func customNextButton() -> Font {
        return Font.custom("AppleSDGothicNeo-SemiBold", size: 17, relativeTo: .caption)
    }
}
