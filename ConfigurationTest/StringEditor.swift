//
//  StringEditor.swift
//  ConfigurationTest
//
//  Created by Paul Wilkinson on 27/5/20.
//  Copyright © 2020 Paul Wilkinson. All rights reserved.
//

import SwiftUI

struct StringEditor: View {
    var title: String
    @Binding var theString: String
    var body: some View {
        Form {
            HStack {
                Spacer()
                Text(title)
                TextField(title, text: $theString)
                Spacer()
            }
        }.navigationBarTitle(title)
        
    }
}

struct StringEditor_Previews: PreviewProvider {
    static var previews: some View {
        StringEditor(title: "Test", theString: .constant("Test value"))
    }
}
