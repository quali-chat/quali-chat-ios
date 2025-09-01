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

import Foundation
import UIKit
import SwiftUI

/// Dark theme colors.
public class CustomDarkColors {
    private static let values = ColorValues(
        accent: UIColor(hexString: "#9BAFF7"),
        alert: UIColor(rgb:0xFF4B55),
        primaryContent: UIColor(rgb:0xFFFFFF),
        secondaryContent: UIColor(rgb:0x696969),
        tertiaryContent: UIColor(rgb:0x8E99A4),
        quarterlyContent: UIColor(rgb:0x6F7882),
        quinaryContent: UIColor(rgb:0xC3E1F6),
        separator: UIColor(rgb:0x21262C),
        system: UIColor(rgb:0x21262C),
        tile: UIColor(rgb:0x394049),
        navigation: UIColor(rgb:0x21262C),
        background: UIColor(rgb:0x000000),
        ems: UIColor(rgb: 0x7E69FF),
        links: UIColor(rgb: 0x0086E6),
        namesAndAvatars: [
            UIColor(rgb:0xCEE59C),
            UIColor(rgb:0x80D4DE),
            UIColor(rgb:0x9BAFF7),
            UIColor(rgb:0xFCA780),
            UIColor(rgb:0xEFB4E2),
            UIColor(rgb:0xAD93F8),
            UIColor(rgb:0x96BFEF),
            UIColor(rgb:0xF8D288)
        ]
    )
    
    public static var uiKit = ColorsUIKit(values: values)
    public static var swiftUI = ColorSwiftUI(values: values)
}
