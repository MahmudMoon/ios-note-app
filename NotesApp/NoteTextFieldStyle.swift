//
//  TextFieldStyle.swift
//  NotesApp
//
//  Created by BJIT on 14/10/26.
//

import SwiftUI

struct NoteTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .font(.system(size: 14, weight: .light, design: .rounded))
            .padding(.all, 12)
            .frame(maxWidth: .infinity, minHeight: 50, alignment: .topLeading)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.cyan, lineWidth: 2)
            }
            .padding(.horizontal, 32)
    }
}

#Preview {
    TextField("Enter New Note", text: .constant(""))
        .textFieldStyle(NoteTextFieldStyle())
}
