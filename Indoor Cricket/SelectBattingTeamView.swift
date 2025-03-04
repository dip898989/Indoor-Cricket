import Foundation
import SwiftUI
import UIKit
import SwiftUICore
struct SelectBattingTeamView: View {
    @ObservedObject var matchSettings: MatchSettings
    @State private var selectedTeam: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Select the Batting Team")
                .font(.largeTitle)
                .padding(.bottom, 20)

            VStack(alignment: .leading, spacing: 10) {
                RadioButton(
                    label: matchSettings.team1Name,
                    isSelected: Binding<Bool>(
                        get: { self.selectedTeam == matchSettings.team1Name },
                        set: { isSelected in
                            if isSelected {
                                self.selectedTeam = matchSettings.team1Name
                            }
                        }
                    ),
                    action: {
                        self.selectedTeam = matchSettings.team1Name
                    }
                )
                RadioButton(
                    label: matchSettings.team2Name,
                    isSelected: Binding<Bool>(
                        get: { self.selectedTeam == matchSettings.team2Name },
                        set: { isSelected in
                            if isSelected {
                                self.selectedTeam = matchSettings.team2Name
                            }
                        }
                    ),
                    action: {
                        self.selectedTeam = matchSettings.team2Name
                    }
                )
            }

            Spacer()

//            NavigationLink(
//                destination: ScoringView(teamName: selectedTeam, matchSettings: matchSettings),
//                isActive: .constant(!selectedTeam.isEmpty)
//            ) {
//                Text("Next")
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(selectedTeam.isEmpty ? Color.gray : Color.green)
//                    .foregroundColor(.white)
//                    .cornerRadius(8)
//            }
            
            .navigationDestination(isPresented: .constant(!selectedTeam.isEmpty)) {
                ScoringView(teamName: selectedTeam, matchSettings: matchSettings)
                Text("Next")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedTeam.isEmpty ? Color.gray : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            .disabled(selectedTeam.isEmpty)
            .padding(.top, 20)
        }
        .padding()
        .navigationBarTitle("Select Batting Team", displayMode: .inline)
    }
}
