//
//  UIVIew.swift
//  VSF
//
//  Created by Thea on 1/10/21.
//

import Foundation
import UIKit

extension UIView {
    func animateCurveOutIn(withDuration: TimeInterval, delay: TimeInterval, completion: @escaping () -> ()) {
        UIView.animate(withDuration: withDuration, delay: delay, options: .curveEaseIn) {
            self.transform = self.transform.translatedBy(x: 0.8, y: 0.8)
        } completion: { animated in
            self.transform = .identity
            completion()
        }
    }
}
