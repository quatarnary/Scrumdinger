//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Bugra Aslan on 12.12.2023.
//

import SwiftUI

struct MeetingTimerView: View {
    let speakers: [ScrumTimer.Speaker]
    let theme: Theme
    
    private var currentSpeaker: String {
        speakers.first(where: { !$0.isCompleted })?.name ?? "someone"
    }
    
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is speaking")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    static var speakers: [ScrumTimer.Speaker] {
        [ScrumTimer.Speaker(name: "John", isCompleted: true), ScrumTimer.Speaker(name: "Doe", isCompleted: false)]
    }
    
    static var previews: some View {
        MeetingTimerView(speakers: speakers, theme: .yellow)
    }
}
