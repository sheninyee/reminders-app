//
//  EditSheet.swift
//
//
//  Created by Ninyee S on 11/5/26.
//

import Foundation
import SwiftUI

struct EditSheet: View {
    // TODO: Add title binding
    @Binding var selectedColor: Color
    @Binding var title: String
    
    var body: some View {
        VStack() {
                // TODO: Add list.bullet.circle.fill icon and TextField
            Text("\(title)")
                .padding()
                .font(.title)
            Image(systemName: "list.bullet.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 60, alignment: .center)
            
            TextField("List Name", text: $title)
                .padding()
            
            ColorChooser(selectedColor: $selectedColor)
            
            Spacer()
        }
        .foregroundStyle(selectedColor)
        .padding()
    }
}

#Preview {
    @Previewable @State var selectedColor: Color = .red
    @Previewable @State var title: String = "List"

    EditSheet(selectedColor: $selectedColor, title: $title)
        .preferredColorScheme(.dark)
}
