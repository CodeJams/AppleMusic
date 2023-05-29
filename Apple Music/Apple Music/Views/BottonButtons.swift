//
//  bottomButtons.swift
//  Apple Music
//
//  Created by Guilherme Ferreira Lenzolari on 29/05/23.
//

import SwiftUI

struct BottomButtons: View {
    var body: some View {
        HStack{
            
            Button {
                print("Quote bubble button was tapped")
            } label: {
                Image(systemName: "quote.bubble")}
            .font(.system(size: 30))

            
            Button {
                print("Airplay button was tapped")
            } label: {
                Image(systemName: "airplayaudio")}
            .font(.system(size: 30))

            
            Button {
                print("list button was tapped")
            } label: {
                Image(systemName: "list.bullet")}
                .font(.system(size: 30))
            
        }
    }
}

