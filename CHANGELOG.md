## 2.2.0

- Added three new composable effects: `BlurEffect`, `FlipEffect`, and `ShakeEffect`.
- Added new ready-to-use widgets: `BlurText`, `FlipText`, and `ShakeText`.
- Extended the fluent API with `.blur()`, `.flip()`, and `.shake()` so the new effects work naturally in multi-effect timelines.
- Updated the example app to showcase the new effects in both chained and preset-style demos.

## 2.1.0

- Refined the example app into a cleaner showcase with grouped sections and more practical demos.
- Added more animation style examples, including ScaleText, ShadowText, BouncingText, FallingText, ColorizedText, WavingGradientText, and CirclingText.
- Expanded fluent composition demos to better show overlapping and sequential multi-effect timelines.
- Fixed the example app deprecation warning by replacing `withOpacity()` with `withValues()`.
- Fixed the example widget test to use the current example app instead of the old counter template.

## 2.0.1

- Update README.md.

## 2.0.0

- Refactored multi-effect support so multiple text effects can be applied more reliably at once.
- Improved animation composition behavior and overall performance.
- `CirclingText` now automatically adjusts radius based on text length.
- Optimized rendering for large texts and multiple effects.

## 1.0.1

- Added publisher information in `pubspec.yaml`.

## 1.0.0

- Added `BouncingText` for sequential character bounce animation.
- Added `ShadowText` for animated text shadow effects.

## 0.0.2

- Removed unnecessary animation start code.

## 0.0.1

- Initial release.
- Added `SlideText`, `TypewriterText`, `WaveMotionText`, `WavingGradientText`, `ShimmerText`, `FadeText`, `ScaleText`, `RotationText`, `MarqueeText`, `FallingText`, and `ColorizedText`.
