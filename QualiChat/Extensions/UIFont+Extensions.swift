// 
// Copyright 2025 Keypair Establishment
// Copyright 2024 New Vector Ltd
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

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

public extension UIFont {
    enum AppFontName: String {
        case regular = "Nunito-Regular",
             bold = "Nunito-Bold",
             light = "Nunito-Light",
             semiBold = "Nunito-SemiBold",
             medium = "Nunito-Medium",
             thin = "Nunito-ExtraLightItalic",
             black = "Nunito-Black",
             heavy = "Nunito-ExtraBold",
             ultraLight = "Nunito-ExtraLight"
    }
    
    @objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regular.rawValue, size: size)!
    }
    
    @objc class func mySystemFontWeight(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        switch weight {
        case .regular:
            return UIFont(name: AppFontName.regular.rawValue, size: size)!
        case .bold:
            return UIFont(name: AppFontName.bold.rawValue, size: size)!
        case .semibold:
            return UIFont(name: AppFontName.semiBold.rawValue, size: size)!
        case .light:
            return UIFont(name: AppFontName.light.rawValue, size: size)!
        case .thin:
            return UIFont(name: AppFontName.thin.rawValue, size: size)!
        case .heavy:
            return UIFont(name: AppFontName.heavy.rawValue, size: size)!
        case .black:
            return UIFont(name: AppFontName.black.rawValue, size: size)!
        case .medium:
            return UIFont(name: AppFontName.medium.rawValue, size: size)!
        case .ultraLight:
            return UIFont(name: AppFontName.ultraLight.rawValue, size: size)!
        default:
            return UIFont(name: AppFontName.regular.rawValue, size: size)!
        }
    }

    @objc class func myBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.bold.rawValue, size: size)!
    }

    @objc class func myItalicSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.light.rawValue, size: size)!
    }

    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
            self.init(myCoder: aDecoder)
            return
        }
        
        var fontName = ""
        switch fontAttribute {
        case "CTFontRegularUsage":
            fontName = AppFontName.regular.rawValue
        case "CTFontEmphasizedUsage", "CTFontBoldUsage":
            fontName = AppFontName.bold.rawValue
        case "CTFontLightUsage", "CTFontObliqueUsage":
            fontName = AppFontName.light.rawValue
        case "CTFontDemiUsage":
            fontName = AppFontName.semiBold.rawValue
        case "CTFontMediumUsage":
            fontName = AppFontName.medium.rawValue
        case "CTFontThinUsage":
            fontName = AppFontName.thin.rawValue
        case "CTFontBlackUsage":
            fontName = AppFontName.black.rawValue
        case "CTFontHeavyUsage":
            fontName = AppFontName.heavy.rawValue
        default:
            fontName = AppFontName.regular.rawValue
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }

    class func overrideInitialize() {
        guard self == UIFont.self else { return }

        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
           let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }
        
        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:weight:))),
           let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFontWeight(ofSize:weight:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }

        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
           let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldSystemFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }

        if let italicSystemFontMethod = class_getClassMethod(self, #selector(italicSystemFont(ofSize:))),
           let myItalicSystemFontMethod = class_getClassMethod(self, #selector(myItalicSystemFont(ofSize:))) {
            method_exchangeImplementations(italicSystemFontMethod, myItalicSystemFontMethod)
        }

        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))),
           let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
    }
    
    static func getFont(forStyle style: UIFont.TextStyle, fontSize: CGFloat, fontFamilyName: UIFont.AppFontName) -> UIFont {
        guard let adjustedFont = UIFont(name: fontFamilyName.rawValue, size: fontSize) else {
            return .systemFont(ofSize: fontSize)
        }
        
        return UIFontMetrics(forTextStyle: style).scaledFont(for: adjustedFont)
    }
    
    static var qualiLargeTitle: UIFont {
        getFont(forStyle: .largeTitle, fontSize: 34.0, fontFamilyName: UIFont.AppFontName.regular)
    }
    
    static var qualiLargeTitleB: UIFont {
        getFont(forStyle: .largeTitle, fontSize: 34.0, fontFamilyName: UIFont.AppFontName.bold)
    }
    
    static var qualiTitle1: UIFont {
       getFont(forStyle: .title1, fontSize: 28.0, fontFamilyName: UIFont.AppFontName.regular)
    }
    
    static var qualiTitle1B: UIFont {
        getFont(forStyle: .title1, fontSize: 28.0, fontFamilyName: UIFont.AppFontName.bold)
    }
    
    static var qualiTitle2: UIFont {
        getFont(forStyle: .title2, fontSize: 22.0, fontFamilyName: UIFont.AppFontName.regular)
    }
    
    static var qualiTitle2B: UIFont {
        getFont(forStyle: .title2, fontSize: 22.0, fontFamilyName: UIFont.AppFontName.bold)
    }
    
    static var qualiTitle3: UIFont {
        getFont(forStyle: .title3, fontSize: 20.0, fontFamilyName: UIFont.AppFontName.regular)
    }
    
    static var qualiTitle3SB: UIFont {
        getFont(forStyle: .title3, fontSize: 20.0, fontFamilyName: UIFont.AppFontName.semiBold)
    }
    
    static var qualiHeadline: UIFont {
        getFont(forStyle: .headline, fontSize: 17.0, fontFamilyName: UIFont.AppFontName.semiBold)
    }
    
    static var qualiSubheadline: UIFont {
        getFont(forStyle: .subheadline, fontSize: 15.0, fontFamilyName: UIFont.AppFontName.regular)
    }
    
    static var qualiBody: UIFont {
        getFont(forStyle: .body, fontSize: 17.0, fontFamilyName: UIFont.AppFontName.regular)
    }
    
    static var qualiBodySB: UIFont {
        getFont(forStyle: .body, fontSize: 17.0, fontFamilyName: UIFont.AppFontName.semiBold)
    }
    
    static var qualiCallout: UIFont {
        getFont(forStyle: .callout, fontSize: 16.0, fontFamilyName: UIFont.AppFontName.regular)
    }
    
    static var qualiCalloutSB: UIFont {
        getFont(forStyle: .callout, fontSize: 16.0, fontFamilyName: UIFont.AppFontName.semiBold)
    }
    
    static var qualiFootnote: UIFont {
        getFont(forStyle: .footnote, fontSize: 13.0, fontFamilyName: UIFont.AppFontName.regular)
    }
    
    static var qualiFootnoteSB: UIFont {
        getFont(forStyle: .footnote, fontSize: 13.0, fontFamilyName: UIFont.AppFontName.semiBold)
    }
    
    static var qualiCaption1: UIFont {
        getFont(forStyle: .caption1, fontSize: 12.0, fontFamilyName: UIFont.AppFontName.regular)
    }
    
    static var qualiCaption1SB: UIFont {
        getFont(forStyle: .caption1, fontSize: 12.0, fontFamilyName: UIFont.AppFontName.semiBold)
    }
    
    static var qualiCaption2: UIFont {
        getFont(forStyle: .caption2, fontSize: 11.0, fontFamilyName: UIFont.AppFontName.regular)
    }
    
    static var qualiCaption2SB: UIFont {
        getFont(forStyle: .caption2, fontSize: 11.0, fontFamilyName: UIFont.AppFontName.semiBold)
    }
    
    static var pillFont: UIFont {
        UIFont.systemFont(ofSize: 15.0)
    }
}

