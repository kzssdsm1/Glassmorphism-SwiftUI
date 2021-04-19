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
            .init(color: .fuchsia, location: 0.0),
            .init(color: .mediumOrchid, location: 0.4),
            .init(color: .deepSkyBlue, location: 0.7),
            .init(color: .vividBlue, location: 1.0)
        ]
    )
    private let cardGradient = Gradient(
        stops: [
            .init(color: .white, location: 0.25),
            .init(color: .clear, location: 1.0)
        ]
    )
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("TEST")
                    .font(.system(size: 60, weight: .medium))
                    .foregroundColor(.cornFlowerBlue)
                    .opacity(0.8)
                    .shadow(color: Color.gray.opacity(0.4), radius: 2, x: 5, y: 5)
            } // HStack
            .background(
                VisualEffectView(effect: UIBlurEffect(style: .regular))
                    .frame(width: 320, height: 220)
                    .cornerRadius(25)
                    .shadow(color: Color.gray.opacity(0.2), radius: 3, x: 12, y: 12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.whiteSmoke.opacity(0.4), lineWidth: 2)
                    )
                    .background(
                        LinearGradient(gradient: cardGradient, startPoint: .topLeading, endPoint: .bottomTrailing)
                            .frame(width: 320, height: 220)
                            .cornerRadius(25)
                            .opacity(0.35)
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
