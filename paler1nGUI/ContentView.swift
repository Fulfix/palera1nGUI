import SwiftUI

struct ContentView: View {
    enum Destination: Hashable {
        case status
        case jailbreak
        case guide
    }
    
    @State private var selectedView: Destination? = .status

    init() {
        // Appeler cette fonction dans le constructeur pour vérifier le premier lancement
        executeScriptIfFirstLaunch()
    }
    
    static let hasLaunchedBeforeKey = "hasLaunchedBefore"
    
    static func isFirstLaunch() -> Bool {
        let hasLaunchedBefore = UserDefaults.standard.bool(forKey: hasLaunchedBeforeKey)
        if hasLaunchedBefore {
            return false
        } else {
            UserDefaults.standard.set(true, forKey: hasLaunchedBeforeKey)
            return true
        }
    }
    
    func executeScriptIfFirstLaunch() {
        if ContentView.isFirstLaunch() {
            let process = Process()
            process.launchPath = "/bin/bash"
            process.arguments = ["/bin/chmod", "+x", "/Applications/palera1nGUI.app/Contents/Ressources/*" ,"&&", "xattr", "-d" , "com.apple.quarantine", "/Applications/palera1nGUI.app/Contents/Ressources/*"]
            process.launch()
            process.waitUntilExit()
        }
    }

    var body: some View {
        NavigationSplitView {
            // Barre latérale
            List(selection: $selectedView) {
                NavigationLink(value: Destination.status) {
                    Text("Device info")
                }
                NavigationLink(value: Destination.jailbreak) {
                    Text("Jailbreak")
                }
                NavigationLink(value: Destination.guide) {
                    Text("Guilde")
                }
            }
            .listStyle(SidebarListStyle()) // Style de la barre latérale
            .navigationTitle("Options")
        } detail: {
            // Contenu principal, qui change en fonction de la sélection
            switch selectedView {
            case .status:
                Status_iPhoneView()
            case .jailbreak:
                JailbreakView()
            case .guide:
                GuideView()
            case .none:
                Text("Sélectionnez une option")
            }
        }
        .onAppear {
            // Si besoin de logiques supplémentaires lorsque la vue apparaît
        }
    }
}

#Preview {
    ContentView()
}
