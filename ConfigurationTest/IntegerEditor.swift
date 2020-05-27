//
//  IntegerEditor.swift
//  ConfigurationTest
//
//  Created by Paul Wilkinson on 27/5/20.
//  Copyright © 2020 Paul Wilkinson. All rights reserved.
//

import SwiftUI

struct IntegerEditor: View {
    var title: String
    @Binding var theInteger: Int
    var body: some View {
        Form {
            HStack {
                Spacer()
                Stepper(title, value: self.$theInteger)
                Text("\(self.theInteger)")
                Spacer()
            }
            Spacer()
        }.navigationBarTitle(title)
    }
}

struct IntegerEditor_Previews: PreviewProvider {
    static var previews: some View {
        IntegerEditor(title: "Test", theInteger: .constant(1))
    }
}
