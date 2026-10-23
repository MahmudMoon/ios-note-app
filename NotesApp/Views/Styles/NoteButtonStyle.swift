//
//  NoteButtonStyle.swift
//  NotesApp
//
//  Created by BJIT on 13/10/26.
//

import SwiftUI

struct NoteButtonStyle: ButtonStyle{
    var isFilled = false
    @Environment(\.isEnabled) private var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .fontWeight(.bold)
            .foregroundStyle(isFilled ? .white : .cyan)
            .padding(.horizontal, 32)
            .padding(.vertical, 14)
            .background{ if isFilled {
                    RoundedRectangle(cornerRadius: 16).fill(.cyan)
                } else {
                    RoundedRectangle(cornerRadius: 16).strokeBorder(.cyan, lineWidth: 2)
                }
            }.opacity(isEnabled ? (configuration.isPressed ? 0.75 : 1) : 0.3)
    }
}
