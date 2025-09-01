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
import SwiftUI

extension String {
    var fixDisplayNameInRoomAvatar: String {
        return replacingOccurrences(of: "\(QualiChatBuildSettings.roomPrefix) ", with: "").replacingOccurrences(of: "\(QualiChatBuildSettings.roomPrefix)", with: "")
    }
    
    var asNSString: NSString {
        self as NSString
    }
    
    func fixDisplayNameInRoomTitle(capHeight: CGFloat) -> NSAttributedString {
        return asNSString.fixDisplayNameInRoomTitle(capHeight: capHeight)
    }
}

@objc extension NSString {
    func fixDisplayNameInRoomTitle(capHeight: CGFloat) -> NSAttributedString {
        if !self.contains(QualiChatBuildSettings.roomPrefix) {
            return NSAttributedString(string: self as String)
        }
        
        guard let image = UIImage(named: QualiChatBuildSettings.roomIconName)?.vc_resized(with: QualiChatBuildSettings.roomIconSize) else {
            return NSAttributedString(string: self as String)
        }
        
        let attributedString = NSMutableAttributedString()
        
        let attachment = NSTextAttachment()
        attachment.image = image
        
        let imageOffsetY = (capHeight - image.size.height) / 2.0
        attachment.bounds = CGRect(x: 0, y: imageOffsetY, width: image.size.width, height: image.size.height)
        
        let attachmentString = NSAttributedString(attachment: attachment)
        
        attributedString.append(attachmentString)
        
        attributedString.append(NSAttributedString(string: " "))
        
        attributedString.append(NSAttributedString(string: (self as String).fixDisplayNameInRoomAvatar))
        
        return attributedString
    }
    
    func fixDisplayNameInRoomAvatar() -> NSString {
        return String(self).fixDisplayNameInRoomAvatar.asNSString
    }
}

extension LocalizedStringKey.StringInterpolation {
    mutating func appendInterpolation(_ linkTitle: String, link url: URL) {
        var linkString = AttributedString(linkTitle)
        linkString.link = url
        self.appendInterpolation(linkString)
    }
    mutating func appendInterpolation(_ linkTitle: String, link urlString: String) {
        self.appendInterpolation(linkTitle, link: URL(string: urlString)!)
    }
}
