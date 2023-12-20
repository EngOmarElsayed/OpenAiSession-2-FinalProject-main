//
//  UserMessageDataModel.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 05/12/2023.
//

import Foundation



struct deviceMessage: Codable, Hashable, Identifiable {
    var role: String
    var content: String
    var id = UUID()
}

struct Conversion: Codable, Identifiable, Hashable {
    var chat: [deviceMessage]
    var id = UUID()
    
    var title: String {
        chat[0].content.lowercased()
    }
}

struct Role {
    static let assistant = "assistant"
    static let user = "user"
    static let system = "system"
}
