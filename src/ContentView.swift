// xcode: set sdk=iOS

//
//  ContentView.swift
//
//
//  Created by Ninyee S on 11/5/26.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false
    // TODO: Add an @State property to hold a RemindersPage struct
    @State private var page: RemindersPage = RemindersPage(
        /* fill in */
        id: UUID(),
        title: "List",
        items: [
            Reminder(title:"Get groceries"),
            Reminder(title:"Complete Compilers Lab"),
            Reminder(title:"Finish Cupboard Ticket"),
            Reminder(title:"Feed sugar pig"),
            Reminder(title:"Write essay")
        ],
        color: .purple
    )
    
    var body: some View {
        VStack() {
            // TODO: Add header view
            HStack {
                Text(page.title)
                    .padding()
                    .font(.title)
                    .foregroundStyle(page.color)
                Spacer()
                Button {
                    isEditing = true;
                } label: {
                    Image(systemName: "info.circle")
                }
                    .frame(width: 30)
                    .padding()
                    .foregroundStyle(page.color)
            }
            
            List {
                // TODO: Loop through the page's reminders using ForEach
                ForEach($page.items) { $reminder in
                    // TODO: Display each reminder row
                    HStack {
                        Button {
                            reminder.isCompleted.toggle()
                        } label: {
                            Image(systemName: reminder.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(page.color)
                        }
                        TextField("Reminder", text: $reminder.title)
                    }
                }
                .onDelete { indexSet in
                    page.items.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
            
            // TODO: Add footer view
            HStack {
                Spacer()
                Button {
                    page.items.append(Reminder(title: ""))
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
                .frame(width: 30)
                .padding()
                .foregroundStyle(page.color)
            }
        }
        .sheet(isPresented: $isEditing) {
            // TODO: Add remaining binding
            EditSheet(selectedColor: $page.color, title: $page.title /* page color */)
        }
    }
}

#Preview {
    ContentView()
}

/*
#Playground {
    _ = 1 + 2
}
*/
