//
//  EditScrumSheet.swift
//  Scrumdinger
//
//  Created by Bugra Aslan on 12.12.2023.
//

import SwiftUI

struct EditScrumSheet: View {
    @Binding var scrum: DailyScrum
    @Binding var isPresentingNewScrumView: Bool
    
    @State private var editingScrum: DailyScrum
    
    init(scrum: Binding<DailyScrum>, isPresentingNewScrumView: Binding<Bool>) {
        self._scrum = scrum
        self._isPresentingNewScrumView = isPresentingNewScrumView
        
        // Initialize editingScrum with the current scrum
        self._editingScrum = State(initialValue: DailyScrum(id: scrum.wrappedValue.id, title: scrum.wrappedValue.title, attendees: scrum.wrappedValue.attendees.map { $0.name }, lengthInMinutes: scrum.wrappedValue.lengthInMinutes, theme: scrum.wrappedValue.theme))
    }
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $editingScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            scrum = editingScrum
                            isPresentingNewScrumView = false
                        }
                    }
                }
        }
    }
}

#Preview {
    EditScrumSheet(scrum: .constant(DailyScrum.sampleData[0]), isPresentingNewScrumView: .constant(true))
}
