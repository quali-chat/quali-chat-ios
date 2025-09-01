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

public extension FontsUIKit {
    
    convenience init(customValues: CustomElementsFonts) {
        self.init(values: ElementFonts())

        self.largeTitle = customValues.largeTitle.uiFont
        self.largeTitleB = customValues.largeTitleB.uiFont
        self.title1 = customValues.title1.uiFont
        self.title1B = customValues.title1B.uiFont
        self.title2 = customValues.title2.uiFont
        self.title2B = customValues.title2B.uiFont
        self.title3 = customValues.title3.uiFont
        self.title3SB = customValues.title3SB.uiFont
        self.headline = customValues.headline.uiFont
        self.subheadline = customValues.subheadline.uiFont
        self.body = customValues.body.uiFont
        self.bodySB = customValues.bodySB.uiFont
        self.callout = customValues.callout.uiFont
        self.calloutSB = customValues.calloutSB.uiFont
        self.footnote = customValues.footnote.uiFont
        self.footnoteSB = customValues.footnoteSB.uiFont
        self.caption1 = customValues.caption1.uiFont
        self.caption1SB = customValues.caption1SB.uiFont
        self.caption2 = customValues.caption2.uiFont
        self.caption2SB = customValues.caption2SB.uiFont
    }
}
