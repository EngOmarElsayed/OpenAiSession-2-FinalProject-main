//
//  AiResponse.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 05/12/2023.
//

import Foundation

// This the data model used to decode the json response

struct AiResponse: Codable {
    let choices: [Response]
}

struct Response: Codable {
    let message: Message
}

////// data sent
struct RequestData: Codable {
    var model: String
    var messages: [Message]
    var temperature: Double = 0.2
}

struct Message: Codable, Hashable {
    var role: String
    var content: String
}
