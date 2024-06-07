//
//  HeaderView.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 07/06/2024.
//

import UIKit

final class HeaderView: UIView {
    
    let superView: UIViewController!
    
    init(superView view: UIViewController) {
        self.superView = view
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        // Dismiss the keyboard
        guard let view = superView.view else { return }
        view.endEditing(true)
    }
}
