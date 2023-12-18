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
                    if !viewModel.isloading && !viewModel.message.isEmpty {
                        isfocus = false
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
        
    }
}

#Preview {
    TextBarView()
        .environmentObject(OpenAIViewModel())
}
