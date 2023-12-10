//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Bugra Aslan on 10.12.2023.
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    var skipAction: ()->Void
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: {!$0.isCompleted}) else { return nil }
        return index + 1
    }
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    var body: some View {
        HStack {
            Text("Speaker 1 of 3")
            Spacer()
            Button(action: {}){
                Image(systemName: "forward.fill")
            }
            .accessibilityLabel("Next Speaker")
        }
    }
}

#Preview {
    MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
        .previewLayout(.sizeThatFits)
}
