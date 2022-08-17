//
//  ContentView.swift
//  DisplayJSON
//
//  Created by Ram Balaji Koppula on 16/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var results = [User]()
    
    var body: some View {
        NavigationView {
            List(results, id: \.name) { item in
                NavigationLink(destination: VStack(){
                    Text(item.name)
                        .font(.headline)
                    Text("\(item.age)")
                        .font(.subheadline)
                    Text("\(item.salary)")
                        .font(.subheadline)
                }){
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text("\(item.age)")
                        .font(.subheadline)
                    Text("\(item.salary)")
                        .font(.subheadline)
                }
            }
            }
        .navigationTitle("Data")
        .task {
            await loadData()
        }
        }
    }
    
    
    
    func loadData() async {
        guard let url = URL(string: "https://aamras.com/dummy/EmployeeDetails.json") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(JSONData.self, from: data) {
                self.results = decodedResponse.employees
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
