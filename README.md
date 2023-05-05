# XProjStep

Convert Xcode project `pbxproj` file to standard format, if has been converted to json or xml using plutil.

```bash
xprojstep input.pbxproj --ouput output.pbxproj --format openstep
```

This command has been created because `plutil` do not allow it.

## Deploy

This tool is mainly used by [4D Mobile App](https://github.com/4d/4D-Mobile-App/blob/main/Resources/scripts/) to transform project created from 4D Object converted to JSON.

To inject a custom build you must place in [Resources/scripts](https://github.com/4d/4D-Mobile-App/blob/main/Resources/scripts/) of `4D Mobile App` component.

## Build

```bash
xcodebuild -configuration Release # will create build/Release/xprojstep
```

## Dependencies

| Name | License | Usefulness |
|-|-|-|
| [XcodeProjKit](https://github.com/phimage/XcodeProjKit) | [MIT](https://github.com/phimage/XcodeProjKit/blob/master/LICENSE) | Parse and write pbxproj |
| [Commander](https://github.com/kylef/Commander ) | [BSD 3](https://github.com/kylef/Commander/blob/master/LICENSE) | command line argument parser |
| [PathKit](https://github.com/kylef/PathKit ) | [BSD 2](https://github.com/kylef/PathKit/blob/master/LICENSE.md) | file management |

Dependencies has been downloaded using [`Carthage` package manager](https://github.com/Carthage/Carthage/)

## Alternative

- [plistconvert](https://github.com/phimage/plistconvert)

## Testing

`test.sh` will launch some tests.
