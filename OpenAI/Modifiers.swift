//
//  Modifiers.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 11/12/2023.
//

import Foundation
import SwiftUI

struct AppTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color(DesignResourses.ColorThem))
            .fontDesign(.monospaced)
    }
}

extension Text {
    func appTextStyle() -> some View {
        self.modifier(AppTextStyle())
    }
}

struct onLoad: ViewModifier {
    let action: () -> Void
    @State private var loaded = false
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                if !loaded {
                    loaded = true
                    action()
                }
            }
    }
}
