//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Bugra Aslan on 2.12.2023.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.bottomhalf.filled")
                }
                Spacer()
                VStack (alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.filled")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time Remaining")
            .accessibilityValue("10 Minutes")
            ProgressView(value: 5, total: 15)
            Circle()
                .strokeBorder(lineWidth: 24)
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {}){
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next Speaker")
            }
        }
        .padding()
    }
}

#Preview {
    MeetingView()
}
