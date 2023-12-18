//
//  circuleAnimationView.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 05/12/2023.
//

import SwiftUI

struct circuleAnimationView: View {
    @State var start: Bool = false
    
    var body: some View {
        Circle()
            .foregroundStyle(Color(DesignResourses.ColorThem))
            .frame(width: start ? 17: 20)
            .opacity(start ? 0.5: 1.0)
            .onAppear(perform: {
                withAnimation(.linear(duration: 0.8).repeatForever()) {
                    start.toggle()
                }
            })
    }
}

#Preview {
    circuleAnimationView()
        .environmentObject(OpenAIViewModel())
}
