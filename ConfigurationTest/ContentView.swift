//
//  ContentView.swift
//  ConfigurationTest
//
//  Created by Paul Wilkinson on 27/5/20.
//  Copyright © 2020 Paul Wilkinson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var configuration: Configuration
    
    var draftConfiguration = Configuration()
    
    var body: some View {
        NavigationView {
            Form {
                HStack {
                    Text("Some string")
                    Text(configuration.someString)
                }
                HStack {
                    Text("Some integer")
                    Text("\(configuration.someInteger)")
                }
                NavigationLink(destination: SettingsView().environmentObject(self.draftConfiguration)) {
                    HStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
            }.navigationBarTitle("Main screen").onAppear() {
                self.draftConfiguration.reset()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Configuration())
    }
}
