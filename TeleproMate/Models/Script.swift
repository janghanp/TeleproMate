//
//  Script.swift
//  TeleproMate
//
//  Created by Janghan Park on 27/9/2025.
//

import Foundation
import SwiftData

@Model
final class Script {
    @Attribute(.unique)var id: UUID
    var title: String
    var content: String
    var createdAt: Date

    init(title: String, content: String) {
        self.id = UUID()
        self.title = title
        self.content = content
        self.createdAt = Date()
    }
}
