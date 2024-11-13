import SwiftUI

struct ContentView: View {
    enum Destination: Hashable {
        case jailbreak
        case guide
    }
    
    @State private var selectedView: Destination? = .jailbreak
    
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
                NavigationLink(value: Destination.jailbreak) {
                    Text("Jailbreak")
                }
                NavigationLink(value: Destination.guide) {
                    Text("Guide")
                }
            }
            .listStyle(SidebarListStyle()) // Style de la barre latérale
            .navigationTitle("Options")
        } detail: {
            // Contenu principal, qui change en fonction de la sélection
            switch selectedView {
            case .jailbreak:
                JailbreakView()
            case .guide:
                GuideView()
            case nil:
                Text("Aucune vue sélectionnée")
            }
        }
    }

    
    #Preview {
        ContentView()
    }
}
