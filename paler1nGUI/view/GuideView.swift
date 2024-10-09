import SwiftUI

struct GuideView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Main title
                Text("Palera1n GUI Guide")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 20)
                
                // Introduction
                Text("Introduction")
                    .font(.title2)
                    .bold()
                Text("""
                    Palera1n is a jailbreak tool for iOS devices, but it is not compatible with all iPhone models. To check if your phone is compatible, visit https://ios.cfw.guide/get-started/. This guide will provide detailed steps on how to use this graphical interface on macOS. Before proceeding, ensure that Palera1n is installed on your system. You can install it by running the following command in your terminal:

                    sudo /bin/sh -c "$(curl -fsSL https://static.palera.in/scripts/install.sh)"

                    Please note that jailbreaking your device may involve certain risks. Use it at your own discretion, and ensure you have backed up all important data before proceeding.
                    """)
                    .padding(.bottom, 10)
                
                // Warning
                Text("⚠️ Warning: Backup and Responsibilities")
                    .font(.headline)
                    .foregroundColor(.red)
                Text("""
                    Jailbreaking voids the warranty of your device and may cause it to malfunction. Be sure to make a full backup using iTunes or iCloud before continuing. If something goes wrong, you might need to restore your device, which could result in data loss.
                    """)
                    .padding(.bottom, 20)
                
                // Step 1
                Text("Step 1: Prepare Your Device")
                    .font(.title2)
                    .bold()
                Text("""
                    a. Connect your iOS device to your Mac using a USB cable.
                    
                    b. If a USB-C to Lightning cable doesn't work, try using a USB-A to Lightning cable.
                    """)
                    .padding(.bottom, 20)
                
                // Step 2
                Text("Step 2: Run the Jailbreak")
                    .font(.title2)
                    .bold()
                Text("""
                    a. Once your device is detected, click on the "Jailbreak" button to begin the process.

                    b. Follow the instructions displayed in the terminal.

                    c. If "device disconnected" appears, try unplugging and reconnecting your device.
                    """)
                    .padding(.bottom, 20)

                // Step 3: Post-Jailbreak
                Text("Step 3: Post-Jailbreak")
                    .font(.title2)
                    .bold()
                Text("""
                    a. Once the jailbreak process is complete, your device will reboot normally.

                    b. You should now see a new app called 'palera1n'. This app will allow you to install Sileo or Zebra, which are like tweak app stores.

                    c. You can explore and install tweaks from these apps. Be sure to download tweaks only from trusted sources to avoid potential risks to your device or data.
                    """)
                    .padding(.bottom, 20)
                
                // Additional Tips
                Text("Additional Tips")
                    .font(.title2)
                    .bold()
                Text("""
                    • Don’t overload your device with too many tweaks at once, as it may slow down or crash your system.
                    
                    • If you encounter any issues, you can always return to a stable state by restoring your device using iTunes or tools like "Palera1n Restore".

                    • Be cautious with iOS updates. A jailbreak may not always be compatible with the latest iOS versions, so check compatibility before updating your device.
                    """)
                    .padding(.bottom, 20)
                
                // Footer
                Text("You are now ready to use the Palera1n graphical interface to manage and customize your iOS device!")
                    .italic()
                    .padding(.bottom, 40)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    GuideView()
}
