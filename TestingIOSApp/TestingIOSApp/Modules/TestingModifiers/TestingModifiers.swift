//
//  TestingModifiers.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 26/04/23.
//

import SwiftUI

struct TestingModifiers: View {
    
    @State var presenting = false
    var message: String = ""
    
    var body: some View {
        VStack {
            Button {
                presenting = true
            } label: {
                Text("Mostrar error")
            }
        }
        .addErrorAlert(showing: $presenting, title: "Mi titulo", message: "Mensaje personalizado de error")
    }
}

struct TestingModifiers_Previews: PreviewProvider {
    static var previews: some View {
        TestingModifiers()
    }
}
