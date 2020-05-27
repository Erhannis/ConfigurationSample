//
//  SettingsView.swift
//  ConfigurationTest
//
//  Created by Paul Wilkinson on 27/5/20.
//  Copyright © 2020 Paul Wilkinson. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var configuration: Configuration
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
            Form {
                NavigationLink(destination: StringEditor(title: "Some string", theString: self.$configuration.someString )) {
                    HStack {
                        Text("Some String:")
                        
                        Text(self.configuration.someString)
                    }
                }
                NavigationLink(destination: IntegerEditor(title: "Some integer", theInteger: self.$configuration.someInteger )) {
                    HStack {
                        Text("Some Integer:")
                        Text("\(self.configuration.someInteger)")
                    }
                }
            }.navigationBarTitle("Settings").navigationBarItems(
                trailing:
                    Button("Save") {
                        self.configuration.save()
                        self.presentation.wrappedValue.dismiss()
                    }
            )
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(Configuration())
    }
}
