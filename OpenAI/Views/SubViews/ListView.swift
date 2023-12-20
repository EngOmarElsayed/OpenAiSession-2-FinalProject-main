//
//  ContentView.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 05/12/2023.
//

import SwiftUI

struct ConversionView: View {
    @EnvironmentObject var viewModel: OpenAIViewModel
    
    var body: some View {
        VStack(alignment: .leading){
                ScrollView {
                    ScrollViewReader { proxy in
                        VStack(alignment: .leading){
                            ForEach(viewModel.selectedConversation.chat) { message in
                                let isLast = message.id == viewModel.selectedConversation.chat[viewModel.lastIndex].id
                                
                                if message.role == Role.assistant {
                                    AiCellView(message: message, islast:isLast)
                                }else {
                                    UserCellView(message: message)
                                }
                                    
                            }
                        }
                        .id("view")
                        .onReceive(viewModel.$response) { _ in
                            proxy.scrollTo("view", anchor: .bottom)
                        }
                        
                    }
                }
        }.padding()
            
            .listStyle(.plain)
        
    }
}

#Preview {
    ConversionView()
        .environmentObject(OpenAIViewModel())
}
