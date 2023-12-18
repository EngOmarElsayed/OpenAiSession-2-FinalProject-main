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
                            ForEach(viewModel.conversation) { message in
                                let isLast = message.id == viewModel.conversation[viewModel.lastIndex].id
                                
                                if message.role == Role.assistant {
                                    AiCellView(message: message, islast:isLast)
                                }else {
                                    UserCellView(message: message)
                                }
                                    
                            }
                        }
                        .id("view")
                        .onReceive(viewModel.$conversation) { _ in
                            proxy.scrollTo("view", anchor: .bottom)
                        }
                        .onReceive(viewModel.$response) { _ in
                            proxy.scrollTo("view", anchor: .bottom)
                        }
                        
                    }
                }
            }
            
            .listStyle(.plain)
        
    }
}

#Preview {
    ConversionView()
        .environmentObject(OpenAIViewModel())
}
