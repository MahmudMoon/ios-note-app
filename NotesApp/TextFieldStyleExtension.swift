//
//  TextFieldStyleExtension.swift
//  NotesApp
//
//  Created by BJIT on 14/10/26.
//

import SwiftUI

extension View {
    func addTextFieldStyle() -> some View {
        self.font(.system(size: 14, weight: .light, design: .rounded))
            .padding(.all, 12)
            .frame(maxWidth: .infinity, minHeight: 50, alignment: .topLeading)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.cyan, lineWidth: 2)
            }
            .padding(.horizontal, 32)
    }
}

