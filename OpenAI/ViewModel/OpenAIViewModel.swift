//
//  OpenAIViewModel.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 05/12/2023.
//

import Foundation

@MainActor class OpenAIViewModel: ObservableObject {
    @Published var message = ""
    @Published var response = ""
    @Published var welcomeText = ""
    @Published var isloading = false
    @Published var conversation: [deviceMessage] = []
    var lastIndex: Int {
        conversation.count-1
    }
    
    let apiManger = APiManger.shared
}

extension OpenAIViewModel {
    func welcomeAnimation() {
        TypoAnimation(for: "How Can I help you today ?", isWelcome: true)
    }
    
    func startaNewConverstion() {
        conversation.removeAll()
    }
    
}

extension OpenAIViewModel {
    func sendMessage() async throws {
        conversation.append(deviceMessage(role: Role.user, content: message))
        conversation.append(deviceMessage(role: Role.assistant, content: ""))
        message = ""
        response = ""
        isloading = true
        
        do {
            let response = try await apiManger.makeRequest(message: conversation)
            conversation[conversation.endIndex-1].content = response.choices[0].message.content
            isloading = false
            TypoAnimation(for: response.choices[0].message.content, isWelcome: false)
        }catch{
            print(error.localizedDescription)
            isloading = false
            conversation[conversation.endIndex-1].content = "There is an error, please check your internat connection."
            TypoAnimation(for: "There is an error, please check your internat connection. ", isWelcome: false)
        }
        
    }
}

extension OpenAIViewModel {
    
    private func TypoAnimation(for text: String, isWelcome: Bool) {
        var charindex = 0.0
        var typingSpeed = 0.02
        let loopOn = text+" "
        
        if isWelcome {
            welcomeText = ""
            typingSpeed = 0.08
        }
        welcomeText = isWelcome ? "": welcomeText
        
        for letter in loopOn {
            Timer.scheduledTimer(withTimeInterval: typingSpeed*charindex, repeats: false) { timer in
                _ = isWelcome ? self.welcomeText.append(letter): self.response.append(letter)
            }
            charindex += 1
        }
    }
}

