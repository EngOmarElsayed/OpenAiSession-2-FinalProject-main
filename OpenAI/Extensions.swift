//
//  Extensions.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 05/12/2023.
//

import Foundation
import SwiftUI

extension JSONEncoder {
    func Encode<T: Codable>(_ data: T) -> Data {
        do{
           return try JSONEncoder().encode(data)
        }catch{
            fatalError("Error encoding the body")
        }
    }
}

extension String: Error {
    static let errorInURL = "ERROR while creating url"
    static let serverError = "The URL couldn't be found"
}

extension [deviceMessage] {
    func convertToMessage() -> [SentMessage] {
        self.map({SentMessage(role: $0.role, content: $0.content)})
    }
}

extension View {
    func OnLoad(action: @escaping ()-> Void) -> some View {
        modifier(onLoad(action: action))
    }
}
