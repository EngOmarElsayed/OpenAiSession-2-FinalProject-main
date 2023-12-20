//
//  StartingView.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 11/12/2023.
//

import SwiftUI

struct StartingView: View {
    @EnvironmentObject var viewModel: OpenAIViewModel
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .center){
                Image(DesignResourses.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                Text(viewModel.welcomeText)
                    .appTextStyle()
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding()
            }
            Spacer()
        }
            .OnLoad{
                viewModel.welcomeAnimation()
            }
    }
    
}

#Preview {
    StartingView()
        .environmentObject(OpenAIViewModel())
}
