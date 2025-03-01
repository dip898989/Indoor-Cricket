import SwiftUI

struct RadioButtonGroup: View {
    let title: String
    let options: [String]
    @Binding var selectedOption: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            HStack {
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        selectedOption = (option == "Yes")
                    }) {
                        HStack {
                            Image(systemName: selectedOption == (option == "Yes") ? "largecircle.fill.circle" : "circle")
                            Text(option)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding(.vertical, 5)
    }
}
