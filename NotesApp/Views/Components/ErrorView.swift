//
//  ErrorView.swift
//  NotesApp
//
//  Created by BJIT on 23/10/26.
//

import SwiftUI

struct ErrorView: View {
    let error: String
    let onRetry: () -> Void

    var body: some View {
        VStack(spacing: 8) {
            Label("Couldn't load notes", systemImage: "exclamationmark.triangle.fill")
                .font(.headline)
                .foregroundStyle(.red)
            Text(error)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            Button {
                onRetry()
            } label: {
                Text("Retry")
            }
            .buttonStyle(NoteButtonStyle(isFilled: false))
        }
        .padding(.horizontal, 32)
    }
}

#Preview {
    ErrorView(error: "The Internet connection appears to be offline.") {}
}
