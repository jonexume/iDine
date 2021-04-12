//
//  itemRow.swift
//  iDine
//
//  Created by Jon Exume on 4/11/21.
//

import SwiftUI

struct itemRow: View {
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    let item: MenuItem
    
    var body: some View {
        HStack {
        Image(item.thumbnailImage)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.gray,
                                     lineWidth: 2))
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
            
            Spacer()
            ForEach(item.restrictions, id: \.self) {
                restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}

struct itemRow_Previews: PreviewProvider {
    static var previews: some View {
        itemRow(item: MenuItem.example)
    }
}
