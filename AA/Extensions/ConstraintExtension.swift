//
//  ConstraintExtension.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 20/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    
    func withRatio() -> CGFloat {
        return self * (UIScreen.main.bounds.width / 375)
    }
    
}

extension Double {
    
    func withRatio() -> CGFloat {
        return CGFloat(self) * (UIScreen.main.bounds.width / 375)
    }
    
}

extension Int {
    
    func withRatio() -> CGFloat {
        return CGFloat(self) * (UIScreen.main.bounds.width / 375)
    }
    
}
