# quali.chat iOS

<p>  
  <a href=https://apps.apple.com/us/app/quali-chat/id6575364693>
  <img alt="Download on the app store" src="https://www.apple.com/lae/itunes/link/images/link_badge_appstore_large_2x.png" width=160>
  </a>
</p>

Native iOS client for quali.chat built with Swift/SwiftUI.

## Requirements

- Xcode 15+, Homebrew, Ruby/Bundler, CocoaPods, XcodeGen

## Getting started

```
xcodegen               # generate .xcodeproj from project.yml/target.yml
pod install            # create Riot.xcworkspace with dependencies
open Riot.xcworkspace  # launch Xcode
```

Alternatively: `./setup_project.sh`. For advanced options (e.g. dev `MatrixSDK`), see [INSTALL.md](./INSTALL.md).

## Build & run

- In Xcode: open `Riot.xcworkspace`, select `QualiChat` and run.
- CLI example:

```
xcodebuild -workspace Riot.xcworkspace -scheme QualiChat -configuration Debug -destination 'platform=iOS Simulator,name=iPhone 15' build | cat
```

## Configuration

Key locations: `Config/*.xcconfig` (IDs, versions, flags), app targets in `QualiChat/` and `QualiChatStaging/`, extensions under their folders, dependencies via `Podfile`. Theming/branding: see [docs/Customisation.md](./docs/Customisation.md). SwiftGen configuration is under `Tools/SwiftGen/`.

## Testing

```
xcodebuild -workspace Riot.xcworkspace -scheme RiotSwiftUI -destination 'platform=iOS Simulator,name=iPhone 15' test | cat
```

## Troubleshooting

- Pods outdated: `pod repo update && pod install`
- Workspace issues: delete `Pods/` + `Podfile.lock`, then `pod install`
- Stale artifacts: clean build folder or remove DerivedData; rerun `xcodegen`

## Support

When you are experiencing an issue on quali.chat iOS, please first search in [GitHub issues](https://github.com/quali-chat/quali-chat-ios/issues).
If after your research you still have a question, feel free to create a GitHub issue if you encounter a bug or a crash, by explaining clearly in detail what happened.

## Copyright & License

Copyright (c) 2014-2017 OpenMarket Ltd  
Copyright (c) 2017 Vector Creations Ltd  
Copyright (c) 2017-2021 New Vector Ltd  
Copyright (c) 2025 Keypair Establishment

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this work except in compliance with the License. You may obtain a copy of the License in the [LICENSE](LICENSE) file, or at:

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
