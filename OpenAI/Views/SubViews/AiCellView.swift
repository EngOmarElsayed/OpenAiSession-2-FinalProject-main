//
//  AiCellView.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 06/12/2023.
//

import SwiftUI

struct AiCellView: View {
    @EnvironmentObject var viewModel: OpenAIViewModel
    var message: deviceMessage
    var islast: Bool
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .firstTextBaseline) {
                Text("Ai: ")
                    .foregroundStyle(Color(DesignResourses.ColorThem))
                    .fontDesign(.monospaced)
                    .padding(.vertical)
                
                Text(islast ? viewModel.response :message.content)
                    .foregroundStyle(Color(DesignResourses.ColorThem))
                    .fontDesign(.monospaced)
                    .multilineTextAlignment(.leading)
                    .padding(.vertical)
                    .overlay {
                        if viewModel.isloading && viewModel.response == "" && islast {
                            circuleAnimationView()
                        }
                    }
                
            }
        }

    }
    
}

#Preview {
    AiCellView(message: deviceMessage(role: Role.assistant, content: ""), islast: true)
        .environmentObject(OpenAIViewModel())
}
