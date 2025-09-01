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

public extension FontSwiftUI {
    
    init(customValues: CustomElementsFonts) {
        self.uiFonts = FontsUIKit(customValues: customValues)
        
        self.largeTitle = customValues.largeTitle.font
        self.largeTitleB = customValues.largeTitleB.font
        self.title1 = customValues.title1.font
        self.title1B = customValues.title1B.font
        self.title2 = customValues.title2.font
        self.title2B = customValues.title2B.font
        self.title3 = customValues.title3.font
        self.title3SB = customValues.title3SB.font
        self.headline = customValues.headline.font
        self.subheadline = customValues.subheadline.font
        self.body = customValues.body.font
        self.bodySB = customValues.bodySB.font
        self.callout = customValues.callout.font
        self.calloutSB = customValues.calloutSB.font
        self.footnote = customValues.footnote.font
        self.footnoteSB = customValues.footnoteSB.font
        self.caption1 = customValues.caption1.font
        self.caption1SB = customValues.caption1SB.font
        self.caption2 = customValues.caption2.font
        self.caption2SB = customValues.caption2SB.font
    }
}
