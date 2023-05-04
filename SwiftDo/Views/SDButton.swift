//
//  SDButton.swift
//  SwiftDo
//
//  Created by Dimitrios Gkarlemos on 04/05/2023.
//

import SwiftUI

struct SDButton: View {
    
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .padding()
    }
}

struct SDButton_Previews: PreviewProvider {
    static var previews: some View {
        SDButton(title: "Title", backgroundColor: .blue) {
            //action
        }
    }
}
