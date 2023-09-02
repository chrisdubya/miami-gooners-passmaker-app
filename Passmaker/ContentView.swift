//
//  ContentView.swift
//  Passmaker
//
//  Created by Chris Williams on 9/2/23.
//

import SwiftUI
import PassKit

struct ContentView: View {
    @State private var qrTest = ""
    
    @State private var thumbnailImageLink = "https://raw.githubusercontent.com/chrisdubya/miami-gooners-memberships/main/assets/305-crest.png"
    
    @State private var primaryLabel = ""
    @State private var primaryValue = ""
    
    @State private var secondaryLabel1 = ""
    @State private var secondaryValue1 = ""
    
    @State private var secondaryLabel2 = ""
    @State private var secondaryValue2 = ""
    
    @State private var auxiliaryLabel1 = ""
    @State private var auxiliaryValue1 = ""
    
    @State private var auxiliaryLabel2 = ""
    @State private var auxiliaryValue2 = ""
    
    @State private var backgroundColor = Color.white
    @State private var textColor = Color.black
    
    @State private var isLoading = false
    
    @State private var newPass: PKPass?
    
    @State private var passSheetVisible = false
    
    var body: some View {
        VStack {
            Form {
                Section("content") {
                    TextField("QR Text", text: self.$qrTest)
                    TextField("Thumbnail Image URL", text: self.$thumbnailImageLink)
                }
                
                Section("Primary Fields") {
                    TextField("Label", text: self.$primaryLabel)
                    TextField("Value", text: self.$primaryValue)
                }
                
                Section("Secondary Fields") {
                    TextField("Label 1", text: self.$secondaryLabel1)
                    TextField("Value 1", text: self.$secondaryValue1)
                    
                    TextField("Label 2", text: self.$secondaryLabel2)
                    TextField("Value 2", text: self.$secondaryValue2)
                }
                
                Section("Auxiliary Fields") {
                    TextField("Label 1", text: self.$auxiliaryLabel1)
                    TextField("Value 1", text: self.$auxiliaryValue1)
                    
                    TextField("Label 2", text: self.$auxiliaryLabel2)
                    TextField("Value 2", text: self.$auxiliaryValue2)
                }
                
                Section("Colors") {
                    ColorPicker("Background Color", selection: self.$backgroundColor)
                    ColorPicker("Text Color", selection: self.$textColor)
                }
                
                Section("Add to wallet") {
                    if (!self.isLoading) {
                        AddPassToWalletButton {
                            print("add pass")
                        }
                    } else {
                        ProgressView()
                    }
                }
            }
        }
        .navigationTitle("Pass Generator")
        .sheet(isPresented: self.$passSheetVisible) {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
