//
//  SideMenu.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 18/12/2023.
//

import SwiftUI

struct SideMenu: View {
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    @Binding var isPresented: Bool
    @EnvironmentObject var vm: OpenAIViewModel
    
    var body: some View {
        Color.gray.opacity(isPresented ? 0.3: 0.0)
            .onTapGesture {
                withAnimation(.default){
                    isPresented = false
                }
            }
            .overlay {
                ZStack(alignment: vm.conversations.isEmpty ? .center: .topLeading) {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.invert)
                        .offset(x: isPresented ? -screenWidth*0.25: -screenWidth)
                    
                    if vm.conversations.isEmpty {
                        emptyConversions(isPresented: $isPresented)
                            .offset(x: isPresented ? -screenWidth*0.12: -screenWidth)
                    }else{
                        SubMenuConversionsView(isPresented: $isPresented)
                        .offset(x: isPresented ? -screenWidth*0.02: -screenWidth, y: screenHeight*0.14)
                        .padding(.horizontal,30)
                    }
                }
                .frame(width: screenWidth*1, height: screenHeight)
                .animation(.linear, value: isPresented)
                
            }
        
    }
}

#Preview {
    SideMenu(isPresented: .constant(true))
        .ignoresSafeArea()
        .environmentObject(OpenAIViewModel())
}
