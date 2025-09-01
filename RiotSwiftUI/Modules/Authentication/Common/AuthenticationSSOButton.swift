//
// Copyright 2025 Keypair Establishment
// Copyright 2022 New Vector Ltd
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

import SwiftUI

/// A button that displays the icon and name of an SSO provider.
struct AuthenticationSSOButton: View {
    // MARK: - Constants
    
    enum Brand: String {
        case apple, facebook, github, gitlab, google, twitter
    }
    
    // MARK: - Private
    
    @Environment(\.theme) private var theme
    @ScaledMetric private var iconSize = 24
    
    private var renderingMode: Image.TemplateRenderingMode? {
        provider.brand == Brand.apple.rawValue || provider.brand == Brand.github.rawValue ? .template : nil
    }
    
    // MARK: - Public
    
    let provider: SSOIdentityProvider
    let action: () -> Void
    
    // MARK: - Views
    
    var body: some View {
        Button(action: action) {
            HStack {
                icon
                #if QUALICHAT
                    .frame(maxWidth: .infinity, alignment: .center)
                #else
                    .frame(maxWidth: .infinity, alignment: .leading)
                #endif
                #if QUALICHAT
                Text(provider.name.replacingOccurrences(of: "Wallet", with: ""))
                    .foregroundColor(theme.colors.primaryContent)
                    .multilineTextAlignment(.center)
                    .layoutPriority(1)
                #else
                Text(VectorL10n.socialLoginButtonTitleContinue(provider.name))
                    .foregroundColor(theme.colors.primaryContent)
                    .multilineTextAlignment(.center)
                    .layoutPriority(1)
                #endif
                icon
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .opacity(0)
            }
            .frame(maxWidth: .infinity)
            .fixedSize(horizontal: false, vertical: true)
            .contentShape(RoundedRectangle(cornerRadius: 8))
        }
        #if QUALICHAT
        .buttonStyle(QualiSecondaryActionButtonStyle(customColor: theme.colors.quinaryContent))
        #else
        .buttonStyle(SecondaryActionButtonStyle(customColor: theme.colors.quinaryContent))
        #endif
    }
    
    /// The icon with appropriate rendering mode and size for dynamic type.
    var icon: some View {
        iconImage.map { image in
            image
                .renderingMode(renderingMode)
                .resizable()
                .scaledToFit()
                .frame(width: iconSize, height: iconSize)
                .foregroundColor(renderingMode == .template ? theme.colors.primaryContent : nil)
        }
    }
    
    /// The image to be shown in the icon.
    var iconImage: Image? {
        switch provider.brand {
        case Brand.apple.rawValue:
            return Image(Asset.Images.authenticationSsoIconApple.name)
        case Brand.facebook.rawValue:
            return Image(Asset.Images.authenticationSsoIconFacebook.name)
        case Brand.github.rawValue:
            return Image(Asset.Images.authenticationSsoIconGithub.name)
        case Brand.gitlab.rawValue:
            return Image(Asset.Images.authenticationSsoIconGitlab.name)
        case Brand.google.rawValue:
            return Image(Asset.Images.authenticationSsoIconGoogle.name)
        case Brand.twitter.rawValue:
            return Image(Asset.Images.authenticationSsoIconTwitter.name)
        default:
            #if QUALICHAT
            switch(provider.id) {
            case "oidc-siwe":
                return Image("etherum_icon")
            case "oidc-aeternity":
                return Image("aeternity_icon")
            default:
                return nil
            }
            #else
            return
            #endif
        }
    }
}

struct AuthenticationSSOButton_Previews: PreviewProvider {
    static var matrixDotOrg = AuthenticationHomeserverViewData.mockMatrixDotOrg
    
    static var buttons: some View {
        VStack {
            ForEach(matrixDotOrg.ssoIdentityProviders) { provider in
                AuthenticationSSOButton(provider: provider) { }
            }
            AuthenticationSSOButton(provider: SSOIdentityProvider(id: "", name: "SAML", brand: nil, iconURL: nil)) { }
        }
        .padding()
    }
    
    static var previews: some View {
        buttons
            .theme(.light).preferredColorScheme(.light)
            .environment(\.sizeCategory, .accessibilityLarge)
        buttons
            .theme(.dark).preferredColorScheme(.dark)
    }
}
