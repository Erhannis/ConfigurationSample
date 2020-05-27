//
//  Configuration.swift
//  ConfigurationTest
//
//  Created by Paul Wilkinson on 27/5/20.
//  Copyright © 2020 Paul Wilkinson. All rights reserved.
//

import Foundation


class Configuration: ObservableObject {
    private static let INTEGER_KEY = "someInteger"
    private static let STRING_KEY = "someString"
    
    @Published var someInteger: Int = 0
    @Published var someString: String = "Default"
    
    init() {
        self.loadDefaults()
        
        NotificationCenter.default.addObserver(forName: .newConfiguration, object: nil, queue: .main) { (notification) in
            self.loadDefaults()
        }
        
    }
    
    private func loadDefaults() {
        let defaults = UserDefaults.standard
        
        self.someInteger = defaults.integer(forKey: Configuration.INTEGER_KEY)
        self.someString = defaults.string(forKey: Configuration.STRING_KEY) ?? "Default"
   
    }
    
    func save() {
        let defaults = UserDefaults.standard
        defaults.set(self.someInteger, forKey: Configuration.INTEGER_KEY)
        defaults.set(self.someString, forKey: Configuration.STRING_KEY)
        NotificationCenter.default.post(name: .newConfiguration, object: self)
    }
    
    func reset() {
        self.loadDefaults()
    }
}

extension NSNotification.Name {
    static let newConfiguration = NSNotification.Name("NewConfiguration")
}
