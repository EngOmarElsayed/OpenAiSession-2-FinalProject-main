//
//  TextBarView.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 06/12/2023.
//

import SwiftUI

struct TextBarView: View {
    @EnvironmentObject var viewModel: OpenAIViewModel
    @FocusState var isfocus
    
    var body: some View {
        HStack {
            TextField("Ask OpenAI Anything", text: $viewModel.message, axis: .vertical)
                .fontDesign(.monospaced)
                .multilineTextAlignment(.leading)
                .padding(.vertical,10)
                .padding(.horizontal)
                .focused($isfocus)
                .onSubmit {
                    Task {
                        try await viewModel.sendMessage()
                    }
                }
            
            Image(systemName: "paperplane")
                .foregroundStyle(.colorThem)
                .padding(.trailing)
                .onTapGesture {
                    withAnimation(.default){
                        isfocus = false
                    }
                    if !viewModel.isloading && !viewModel.message.isEmpty {
                        Task {
                            try await viewModel.sendMessage()
                        }
                    }
                }
        }
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 0.4)
                .foregroundStyle(Color(DesignResourses.ColorThem))
        }
        .padding()
        .toolbar(content: {
            ToolbarItem(placement: .keyboard) {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation(.default){
                            isfocus = false
                        }
                    }, label: {
                        Text("Done")
                    })
                }
            }
        })
        
    }
}

#Preview {
    TextBarView()
        .environmentObject(OpenAIViewModel())
}
