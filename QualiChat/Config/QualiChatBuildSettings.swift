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

@objc
class QualiChatBuildSettings: NSObject {
    
    @objc static let serverChangingOptionEnabled = false
    @objc static let enableCreateSpaces = true
    @objc static let enableAddCreateSpaces = false
    @objc static let registerUseCaseScreenEnabled = false
    @objc static let enableCreateOnlyDirectChat = false
    @objc static let limitPersonCreateOnlyDirectChat = 21
    @objc static let forceDarkTheme = true
    @objc static let enableVideoAudioCall = true
    @objc static let enableVideoCall = false
    @objc static let enableCommandDirectChatInput = false
    @objc static let enableLoginScreen = true
    @objc static let enableFeedbackScreen = false
    @objc static let enableEmailUserCreateDirectChat = false
    @objc static let enableRoomSettingsScreenShowAdvancedSettingsIDRoom = false
    @objc static let enableThreadsNotice = false
    
    @objc static let aboutUsURL = "https://quali.chat"
    @objc static let termsOfUseURL = "https://quali.chat/terms"
    @objc static let thirdPartyNoticeURL = "https://quali.chat/ios-third-party-notices"
    
    @objc static let sentryDSN = "https://2c65253cd3c713cf7e85d3157771fa88@sentry.quali.chat/4"
    
    @objc static let nameLottieLoadingView = "quali-chat-logo"
    
    @objc static let roomPrefix = "[TG]"
    @objc static let roomIconName = "etherum_icon"
    @objc static let roomIconSize =  CGSize(width: 30, height: 20)
    @objc static let cornerRadiusButton = 25.0
}
