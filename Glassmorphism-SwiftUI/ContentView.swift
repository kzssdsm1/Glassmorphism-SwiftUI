//
//  ContentView.swift
//  Glassmorphism-SwiftUI
//
//  Created on 2021/04/19.
//

import SwiftUI

struct ContentView: View {
    private let backgroundGradient = Gradient(
        stops: [
            .init(color: .vividCyan, location: 0.0),
            .init(color: .softViolet, location: 0.5),
            .init(color: .softRed, location: 1.0)
        ]
    )
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                
            } // HStack
            .background(
                VisualEffectView(effect: UIBlurEffect(style: .light))
                    .frame(width: 320, height: 220)
                    .cornerRadius(25)
                    .shadow(color: Color.gray.opacity(0.2), radius: 3, x: 12, y: 12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.whiteSmoke.opacity(0.8), lineWidth: 13)
                            .blur(radius: 15)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.whiteSmoke.opacity(0.6), lineWidth: 2)
                    )
            )
        } // VStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(gradient: backgroundGradient, startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.8)
                .blur(radius: 4.0)
                .edgesIgnoringSafeArea(.all)
        )
    } // body
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
