//
//  JailbreakView.swift
//  paler1nGUI
//
//  Created by denis on 05/10/2024.
//

import SwiftUI

struct JailbreakView: View {
    func runterminal(file: String) {
        let process = Process()
        process.launchPath = "/usr/bin/python3"

        // Use the 'file' variable to get the full path
        if let scriptPath = Bundle.main.path(forResource: file, ofType: "py") {
            process.arguments = [scriptPath]
            process.launch()
        } else {
            print("The file \(file).py was not found in the bundle.")
        }

    }

    var body: some View {
        ScrollView {
            VStack {

                // Instruction text for installation
                Text("⚠️ Before proceeding, ensure that Palera1n is installed on your system. You can install it by running the following command in your terminal:")
                    .font(.headline)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding()
                HStack{
                    Text("sudo /bin/sh -c \"$(curl -fsSL https://static.palera.in/scripts/install.sh)\"")
                        .font(.body)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.gray.opacity(0.2)) // Light background for better visibility
                        .cornerRadius(10) // Rounded corners for better aesthetics
                        .lineLimit(nil) // Allow multiple lines if needed
                    // Button to copy the command to clipboard
                    Button(action: {
                        let pasteboard = NSPasteboard.general
                        pasteboard.clearContents() // Clear existing contents
                        pasteboard.setString("sudo /bin/sh -c \"$(curl -fsSL https://static.palera.in/scripts/install.sh)\"", forType: .string)
                    }) {
                        Text("Copy Command")
                            .padding()
                            .background(Color("secondary"))
                            .cornerRadius(10)
                    }
                    .buttonStyle(PlainButtonStyle())


                }





                // Spacing between instruction and buttons
                Spacer(minLength: 20)

                HStack {
                    // Rootless Button
                    Button(action: {
                        runterminal(file: "rootless")
                    }) {
                        VStack {
                            Text("Rootless")
                                .font(.title)
                                .foregroundColor(.white) // Text color
                                .padding(.top) // Top padding for text

                            Text("Install the rootless jailbreak. This mode keeps the system partition untouched, providing a more stable experience.")
                                .font(.subheadline)
                                .foregroundColor(.white) // Text color
                                .multilineTextAlignment(.center)
                                .padding([.top, .leading, .trailing], 5.0) // Padding for description
                        }
                        .frame(width: 300, height: 150)
                        .background(Color("AccentColor")) // Background color
                        .cornerRadius(20)
                        .padding() // Rounded corners
                    }
                    .buttonStyle(PlainButtonStyle())

                    // Rootfull Button
                    Button(action: {
                        runterminal(file: "rootfull")
                    }) {
                        VStack {
                            Text("Rootfull")
                                .font(.title)
                                .foregroundColor(.white) // Text color
                                .padding(.top) // Top padding for text

                            Text("Install the rootfull jailbreak. This mode modifies the system partition, allowing deeper customizations.")
                                .font(.subheadline)
                                .foregroundColor(.white) // Text color
                                .multilineTextAlignment(.center)
                                .padding([.top, .leading, .trailing], 5.0) // Padding for description
                        }
                        .frame(width: 300, height: 150)
                        .background(Color("AccentColor")) // Background color
                        .cornerRadius(20)
                        .padding() // Rounded corners
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                HStack {
                    Button(action: {
                        runterminal(file: "APFS")
                    }){
                        VStack {
                            Text("create APFS volume")
                                .font(.title)
                                .foregroundColor(.white) // Text color
                                .padding(.top) // Top padding for text
                            
                            Text("Remove the rootless jailbreak. This will restore the device to its previous state without altering the system partition.")
                                .font(.subheadline)
                                .foregroundColor(.white) // Text color
                                .multilineTextAlignment(.center)
                                .padding([.top, .leading, .trailing], 5.0) // Padding for description
                        }
                        .frame(width: 300, height: 150)
                        .background(Color("AccentColor")) // Background color
                        .cornerRadius(20) // Rounded corners
                        .padding()
                    }
                    .buttonStyle(PlainButtonStyle())
                }

                }

                HStack {
                    // Delete Rootfull Button
                    Button(action: {
                        runterminal(file: "delrootfull")
                    }) {
                        VStack {
                            Text("Del Rootfull")
                                .font(.title)
                                .foregroundColor(.white) // Text color
                                .padding(.top) // Top padding for text

                            Text("Remove the rootfull jailbreak. This will restore the device to its original state.")
                                .font(.subheadline)
                                .foregroundColor(.white) // Text color
                                .multilineTextAlignment(.center)
                                .padding([.top, .leading, .trailing], 5.0) // Padding for description
                        }
                        .frame(width: 300, height: 150)
                        .background(Color("AccentColor")) // Background color
                        .cornerRadius(20)
                        .padding() // Rounded corners
                    }
                    .buttonStyle(PlainButtonStyle())

                    // Delete Rootless Button
                    Button(action: {
                        runterminal(file: "delrootless")
                    }) {
                        VStack {
                            Text("Del Rootless")
                                .font(.title)
                                .foregroundColor(.white) // Text color
                                .padding(.top) // Top padding for text

                            Text("Remove the rootless jailbreak. This will restore the device to its previous state without altering the system partition.")
                                .font(.subheadline)
                                .foregroundColor(.white) // Text color
                                .multilineTextAlignment(.center)
                                .padding([.top, .leading, .trailing], 5.0) // Padding for description
                        }
                        .frame(width: 300, height: 150)
                        .background(Color("AccentColor")) // Background color
                        .cornerRadius(20) // Rounded corners
                        .padding()
                    }
                    .buttonStyle(PlainButtonStyle())
            }
            .padding()
        }
    }
}

#Preview {
    JailbreakView()
}
