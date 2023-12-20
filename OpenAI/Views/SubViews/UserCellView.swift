//
//  CellView.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 06/12/2023.
//

import SwiftUI

struct UserCellView: View {
    @EnvironmentObject var viewModel: OpenAIViewModel
    @State var isCopyPresed = false
    var message: deviceMessage
    var pastboard = UIPasteboard.general
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .firstTextBaseline) {
                Text("You: ")
                    .foregroundStyle(Color(DesignResourses.ColorThem))
                    .fontDesign(.monospaced)
                    .padding(.vertical)
                
                Text(message.content)
                    .foregroundStyle(Color(DesignResourses.ColorThem))
                    .fontDesign(.monospaced)
                    .multilineTextAlignment(.leading)
                    .padding(.vertical)
            }
            HStack {
                Spacer()
                Image(systemName: isCopyPresed ? "checkmark": "doc.on.doc")
                    .padding()
                    .onTapGesture {
                        withAnimation(.default){
                            isCopyPresed.toggle()
                            pastboard.string = message.content
                            DispatchQueue.main.asyncAfter(deadline:.now()+1.5) {
                                isCopyPresed.toggle()
                            }
                        }
                    }
            }
        }
        
        
    }
}

#Preview {
    UserCellView(message: deviceMessage(role: Role.assistant, content: "How can I help you ?"))
        .environmentObject(OpenAIViewModel())
}
