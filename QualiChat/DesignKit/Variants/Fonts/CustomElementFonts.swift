// 
// Copyright 2025 Keypair Establishment
// Copyright 2023 New Vector Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import UIKit
import SwiftUI

@objcMembers
public class CustomElementsFonts {
    
    public struct SharedFont {
        public let uiFont: UIFont
        public let font: Font
    }
    
    // MARK: - Setup
    
    public init() {}
    
    // MARK: - Private

    fileprivate func font(forTextStyle textStyle: UIFont.TextStyle, compatibleWith traitCollection: UITraitCollection? = nil) -> UIFont {
        return UIFont.preferredFont(forTextStyle: textStyle, compatibleWith: traitCollection)
    }
}

extension CustomElementsFonts: Fonts {
    
    public var largeTitle: SharedFont {
        return SharedFont(uiFont: .qualiLargeTitle, font: .init(UIFont.qualiLargeTitle))
    }
    
    public var largeTitleB: SharedFont {
        return SharedFont(uiFont: .qualiLargeTitleB, font: .init(UIFont.qualiLargeTitleB))
    }
            
    public var title1: SharedFont {
        return SharedFont(uiFont: .qualiTitle1, font: .init(UIFont.qualiTitle1))
    }
    
    public var title1B: SharedFont {
        return SharedFont(uiFont: .qualiTitle1B, font: .init(UIFont.qualiTitle1B))
    }
    
    public var title2: SharedFont {
        return SharedFont(uiFont: .qualiTitle2, font: .init(UIFont.qualiTitle2))
    }
    
    public var title2B: SharedFont {
        return SharedFont(uiFont: .qualiTitle2B, font: .init(UIFont.qualiTitle2B))
    }
    
    public var title3: SharedFont {
        return SharedFont(uiFont: .qualiTitle3, font: .init(UIFont.qualiTitle3))
    }
    
    public var title3SB: SharedFont {
        return SharedFont(uiFont: .qualiTitle3SB, font: .init(UIFont.qualiTitle3SB))
    }
    
    public var headline: SharedFont {
        return SharedFont(uiFont: .qualiHeadline, font: .init(UIFont.qualiHeadline))
    }
    
    public var subheadline: SharedFont {
        return SharedFont(uiFont: .qualiSubheadline, font: .init(UIFont.qualiSubheadline))
    }
    
    public var body: SharedFont {
        return SharedFont(uiFont: .qualiBody, font: .init(UIFont.qualiBody))
    }
    
    public var bodySB: SharedFont {
        return SharedFont(uiFont: .qualiBodySB, font: .init(UIFont.qualiBodySB))
    }
    
    public var callout: SharedFont {
        return SharedFont(uiFont: .qualiCallout, font: .init(UIFont.qualiCallout))
    }
    
    public var calloutSB: SharedFont {
        return SharedFont(uiFont: .qualiCalloutSB, font: .init(UIFont.qualiCalloutSB))
    }
    
    public var footnote: SharedFont {
        return SharedFont(uiFont: .qualiFootnote, font: .init(UIFont.qualiFootnote))
    }
    
    public var footnoteSB: SharedFont {
        return SharedFont(uiFont: .qualiFootnoteSB, font: .init(UIFont.qualiFootnoteSB))
    }
    
    public var caption1: SharedFont {
        return SharedFont(uiFont: .qualiCaption1, font: .init(UIFont.qualiCaption1))
    }
    
    public var caption1SB: SharedFont {
        return SharedFont(uiFont: .qualiCaption1SB, font: .init(UIFont.qualiCaption1SB))
    }
    
    public var caption2: SharedFont {
        return SharedFont(uiFont: .qualiCaption2, font: .init(UIFont.qualiCaption2))
    }
    
    public var caption2SB: SharedFont {
        return SharedFont(uiFont: .qualiCaption2SB, font: .init(UIFont.qualiCaption2SB))
    }
    
}
