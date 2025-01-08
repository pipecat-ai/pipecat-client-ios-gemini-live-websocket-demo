import SwiftUI

struct PreJoinView: View {
    
    @State var geminiAPIKey: String

    @EnvironmentObject private var model: CallContainerModel
    
    init() {
        let currentSettings = SettingsManager.getSettings()
        self.geminiAPIKey = currentSettings.geminiAPIKey
    }

    var body: some View {
        VStack(spacing: 20) {
            Image("pipecat")
                .resizable()
                .frame(width: 80, height: 80)
            Text("Pipecat Client iOS.")
                .font(.headline)
            SecureField("Gemini API Key", text: $geminiAPIKey)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: .infinity)
                .padding([.bottom, .horizontal])
            Button("Connect") {
                self.model.connect(geminiAPIKey: self.geminiAPIKey)
            }
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color.backgroundApp)
        .toast(message: model.toastMessage, isShowing: model.showToast)
    }
}

#Preview {
    PreJoinView().environmentObject(MockCallContainerModel() as CallContainerModel)
}
