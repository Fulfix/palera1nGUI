import SwiftUI
import Foundation

struct Status_iPhoneView: View {
    @State private var deviceInfo: String = ""
    let ideviceinfoPath = Bundle.main.path(forResource: "ideviceinfo", ofType: "")

    var body: some View {
        ScrollView {
            VStack {
                Text("Device info")
                    .font(.title)
                    .padding()
                
                Button(action: {
                    do {
                        if let ideviceinfoPath = Bundle.main.path(forResource: "ideviceinfo", ofType: "") {
                                                    deviceInfo = try shell(ideviceinfoPath)
                                                } else {
                                                    deviceInfo = "Binaire 'ideviceinfo' introuvable dans le bundle."
                                                }
                    } catch {
                        // Gestion de l'erreur
                        deviceInfo = "Erreur lors de l'exécution de la commande"
                        print("Erreur : \(error)")
                    }
                }) {
                    Text("get Device Info")
                        .foregroundColor(.white) // Couleur du texte
                        .font(.headline) // Taille de la police
                        .frame(width: 250, height: 60) // Taille de la surface cliquable
                        .background(Color("AccentColor")) // Couleur de fond du bouton
                        .cornerRadius(10) // Coins arrondis
                        .clipShape(Capsule())
                }

                // Utilisation d'un ZStack pour permettre au rectangle de s'adapter à son contenu
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.white)
                        .padding() // Ajoute un espacement autour du rectangle
                    Text(deviceInfo.isEmpty ? "No Device info" : deviceInfo)
                        .padding(.all, 44.0)
                        .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity) // Permet au rectangle de s'étendre
                .padding(20) // Ajoute un espacement horizontal
            }
            .buttonStyle(PlainButtonStyle())
        }
    }

    // Fonction pour exécuter une commande shell
    @discardableResult
    func shell(_ command: String) throws -> String {
        let task = Process()
        let pipe = Pipe()
        
        task.standardOutput = pipe
        task.standardError = pipe
        task.arguments = ["-c", command]
        task.executableURL = URL(fileURLWithPath: "/bin/zsh")
        task.standardInput = nil

        try task.run()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8) ?? "Erreur"
        
        return output
    }
}

#Preview {
    Status_iPhoneView()
}
