//
//  PageView.swift
//  DisplayJSON
//
//  Created by Ram Balaji Koppula on 17/08/22.
//

import SwiftUI

struct PageView: View {
    
    var employee : User
    
    var body: some View {
        VStack() {
            Text(employee.name)
                .font(.headline)
            Text("\(employee.age)")
                .font(.subheadline)
            Text("\(employee.salary)")
                .font(.subheadline)
        }
    }
}
