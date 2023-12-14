//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Bugra Aslan on 12.12.2023.
//

import SwiftUI

struct MeetingTimerView: View {
    let speakers: [ScrumTimer.Speaker]
    let isRecording: Bool
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
                    // On top of the tutorial I added the bold font weight and
                    // foregroundStyle green or red depending on the record state
                    // I also changed the mic icon to waveform.circle because mic may get confused with mic is on or off, however we are trying to indicate the recording, however there is no waveform.circle.slash hence I went with record.circle
                    // As for the color I chose red when recording and theme.accentColor to indicate the recording
                    // Red is used universal recording color so I think that makes sense but I'm open to suggestions
                    Image(systemName: isRecording ? "waveform.circle" : "record.circle")
                        .font(.title)
                        .bold(true)
                        .padding(.top)
                        .foregroundStyle(isRecording ? .red : theme.accentColor)
                        .accessibilityLabel(isRecording ? "with transcription" : "without transcription")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
            .overlay {
                ForEach(speakers) { speaker in
                    if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                        SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                            .rotation(Angle(degrees: -90.0))
                            .stroke(theme.mainColor, lineWidth: 12.0)
                    }
                }
            }
            .padding(.horizontal)
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    static var speakers: [ScrumTimer.Speaker] {
        [ScrumTimer.Speaker(name: "John", isCompleted: true), ScrumTimer.Speaker(name: "Doe", isCompleted: false)]
    }
    
    static var previews: some View {
        MeetingTimerView(speakers: speakers, isRecording: true, theme: .yellow)
    }
}
