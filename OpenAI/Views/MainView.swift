//
//  MainView.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 11/12/2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: OpenAIViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            if viewModel.conversation.isEmpty {
                StartingView()
            }else {
                ConversionView()
            }
            TextBarView()
        }.padding()
            .toolbar(content: {
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        viewModel.startaNewConverstion()
                    }, label: {
                        Image(systemName: "square.and.pencil")                          .foregroundStyle(.colorThem)
                    })
                }
            })
    }
}

#Preview {
    NavigationStack {
        MainView()
            .environmentObject(OpenAIViewModel())
    }
}
