    //
    //  MeetingHeaderView.swift
    //  Scrumdinger
    //
    //  Created by Bugra Aslan on 8.12.2023.
    //

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    let theme: Theme
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Seconds\nElapsed")
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                Spacer()
                Text("Seconds\nRemaining")
                    .font(.caption)
                    .multilineTextAlignment(.trailing)
            }
            HStack {
                VStack (alignment: .leading) {
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.filled")
                }
                
                ProgressView(value: progress)
                    .progressViewStyle(ScrumProgressViewStyle(theme: theme))
                    
                VStack (alignment: .trailing) {
                    Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.filled")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time Remaining")
        .accessibilityValue("\(minutesRemaining) Minutes")
        .padding([.top, .horizontal])
    }
}

#Preview {
    MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 100, theme: .bubblegum)
        .previewLayout(.sizeThatFits)
}
