//
//  CellView.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 06/12/2023.
//

import SwiftUI

struct UserCellView: View {
    @EnvironmentObject var viewModel: OpenAIViewModel
    var message: deviceMessage
    
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
        }
        
        
    }
}

#Preview {
    UserCellView(message: deviceMessage(role: Role.assistant, content: "How can I help you ?"))
        .environmentObject(OpenAIViewModel())
}
