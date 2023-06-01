//
//  BlurView.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/22.
//

import SwiftUI

import UIKit

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    //.extraLight, .light, .dark 
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blurEffectView)
        NSLayoutConstraint.activate([
            blurEffectView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurEffectView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BlurView>) {}
}
