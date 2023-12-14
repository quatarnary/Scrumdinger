//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by Bugra Aslan on 14.12.2023.
//

import SwiftUI

struct HistoryView: View {
    let history: History
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees:")
                    .font(.headline)
                Text(history.attendeeString)
                if let transcript = history.transcript {
                    Text("Transcript:")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

// I don't think this is a good place to put the History extension here just for the sake of tutorial I'm doing it here. Through out the tutorial Apple just provided this kind of extensions all over the place and for teaching purposes it makes sense, but in reality even tho I follow the tutorial I don't know which extensions are where. This is not SOLID!
extension History {
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map { $0.name })
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var history: History {
        History(attendees: [
            DailyScrum.Attendee(name: "John"),
            DailyScrum.Attendee(name: "Doe"),
            DailyScrum.Attendee(name: "Ilyas")
        ],
                transcript: "Darla, would you like to start today? Sure, yesterday I reviewed Luis' PR and met with the design team to finalize the UI..."
        )
    }
    
    static var previews: some View{
        HistoryView(history: history)
    }
}
