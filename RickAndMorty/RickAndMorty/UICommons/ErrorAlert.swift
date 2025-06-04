//
//  ErrorAlert.swift
//  RickAndMorty
//
//  Created by Anton on 04/06/2025.
//

import SwiftUI

extension View {
    
    internal func errorAlert(
        title: String,
        message: Binding<String?>,
        buttonTitle: String = "OK",
        retryTitle: String? = nil,
        retryAction: (() -> Void)? = nil
    ) -> some View {
        let isPresented: Binding<Bool> = .init(
            get: { message.wrappedValue != nil },
            set: { newValue in
                if !newValue { message.wrappedValue = nil }
            }
        )
        
        return self.alert(title, isPresented: isPresented) {
            if let retryTitle: String,
               let retryAction: () -> Void {
                Button(retryTitle) {
                    message.wrappedValue = nil
                    retryAction()
                }
            }
            
            Button(buttonTitle, role: .cancel) {
                message.wrappedValue = nil
            }
        } message: {
            Text(message.wrappedValue ?? "")
        }
    }
}
