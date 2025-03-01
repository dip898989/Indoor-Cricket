import SwiftUI





struct SelectionView: View {
    @ObservedObject var matchSettings: MatchSettings
    @State private var hasChanges: Bool = false
    @State private var path = NavigationPath()
    @State private var selectedRadioID = "Option1"
    let radioOptions = [
        ("Option1", "First Option")
    ]

    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .leading, spacing: 20) {
                Text("MATCH SETTINGS")
//                    .font(.headline)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .center)
                
                // Team Configuration Section
                VStack(alignment: .leading, spacing: 0) {
                    Text("PLAYERS COUNT IN EACH TEAM")
//                        .font(.headline)
                        .font(.system(size: 18, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text("")
                    TextField(
                        "Number of players in each team",
                        value: $matchSettings.numberOfPlayers,
                        formatter: NumberFormatter(),
                        onEditingChanged: { _ in self.hasChanges = true }
                    )
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center) // Center align text
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )

                // Scoring Rules Section
                VStack(alignment: .leading, spacing: 0) {
                    Text("SCORING RULES")
//                        .font(.headline)
                        .font(.system(size: 18, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text("")
                    Group {
                        HStack {
                            Text("Runs for each Wide, No Ball")
                            Spacer()
                            TextField(
                                "",
                                value: $matchSettings.runsPerWideNoBall,
                                formatter: NumberFormatter(),
                                onEditingChanged: { _ in self.hasChanges = true }
                            )
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .multilineTextAlignment(.center) // Center align text
                            .frame(width: 50)
                        }
                        HStack {
                            Text("Runs for each Grounded Boundary")
                            Spacer()
                            TextField(
                                "",
                                value: $matchSettings.runsPerGroundedBoundary,
                                formatter: NumberFormatter(),
                                onEditingChanged: { _ in self.hasChanges = true }
                            )
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .multilineTextAlignment(.center) // Center align text
                            .frame(width: 50)
                        }
                        HStack {
                            Text("Runs for each Aerial Boundary")
                            Spacer()
                            TextField(
                                "",
                                value: $matchSettings.runsPerAerialBoundary,
                                formatter: NumberFormatter(),
                                onEditingChanged: { _ in self.hasChanges = true }
                            )
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .multilineTextAlignment(.center) // Center align text
                            .frame(width: 50)
                        }
                        HStack {
                            Text("Runs upon each Dismissal")
                            Spacer()
                            TextField(
                                "",
                                value: $matchSettings.runsDeductedPerDismissal,
                                formatter: NumberFormatter(),
                                onEditingChanged: { _ in self.hasChanges = true }
                            )
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .multilineTextAlignment(.center) // Center align text
                            .frame(width: 50)
                        }
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                
                // Last Over Re-ball upon EXTRAS Section
                VStack(alignment: .leading, spacing: 0) {
                    Text("Last over Re-ball upon EXTRAS")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 18, weight: .bold))
                    Text("")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    HStack(spacing: 1) {
                        Spacer()
                        RadioButton(
                            label: "Yes",
                            isSelected: $matchSettings.lastOverReballOnExtras,
                            action: {
                                matchSettings.lastOverReballOnExtras = true
                                self.hasChanges = true
                            }
                        )
                        Spacer()
                        RadioButton(
                            label: "No",
                            isSelected: Binding<Bool>(
                                get: { !matchSettings.lastOverReballOnExtras },
                                set: { newValue in
                                    matchSettings.lastOverReballOnExtras = !newValue
                                    self.hasChanges = true
                                }
                            ),
                            action: {
                                matchSettings.lastOverReballOnExtras = false
                                self.hasChanges = true
                            }
                        )
                        Spacer()
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )

                // BONUS OVER Section
                VStack(alignment: .leading, spacing: 0) {
                    Text("BONUS OVER")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 18, weight: .bold))
                    Text("")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .center)
                    HStack {
                        Spacer()
                        RadioButton(
                            label: "Yes",
                            isSelected: $matchSettings.bonusOver,
                            action: {
                                matchSettings.bonusOver = true
                                self.hasChanges = true
                            }
                        )
                        Spacer()
                        RadioButton(
                            label: "No",
                            isSelected: Binding<Bool>(
                                get: { !matchSettings.bonusOver },
                                set: { newValue in
                                    matchSettings.bonusOver = !newValue
                                    self.hasChanges = true
                                }
                            ),
                            action: {
                                matchSettings.bonusOver = false
                                self.hasChanges = true
                            }
                        )
                        Spacer()
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(10)
                .frame(maxWidth: .infinity, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                
                // Save Button
                Button(action: {
                    self.hasChanges = false
                    // Implement save functionality here
                }) {
                    Text("SAVE")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(hasChanges ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(!hasChanges)

                // Next Button
                Button(action: {
                    self.path.append("Team1DetailsView")
                }) {
                    Text("NEXT")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
//            .navigationBarTitle("Selection View", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationDestination(for: String.self) { value in
                if value == "Team1DetailsView" {
                    Team1DetailsView(matchSettings: matchSettings)
                }
            }
        }
    }
}



// RadioButton Component
struct RadioButton: View {
    let label: String
    @Binding var isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: {
            isSelected.toggle()
            action()
        }) {
            HStack {
                Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                Text(label)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
