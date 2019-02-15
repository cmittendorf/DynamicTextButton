DynamicTextButton
=================

This Xcode project written in Swift is a simple example for a bug in iOS Accessibility Support ([Ressources](https://support.apple.com/accessibility/iphone-ipad), [SDK](https://developer.apple.com/documentation/uikit/accessibility)) for dynamic content sizes.

An introduction to accessibility by Sommer Panage at [UIKonf 2017](http://uikonf.com): [Accessibility: iOS for All](https://www.youtube.com/watch?v=G01Ac5njNSs).

When adding accessibility support to an app I discovered a couple of problems when using dynamic content sizes with UIButton.

<table>
<tr>
<td>
<img src="./screenshot-1.png" alt="screen when launching the app">
</td>
<td>
<img src="./screenshot-2.png" alt="screen after switching accessibilityExtraExtraExtraLarge">
</td>
<td>
<img src="./screenshot-3.png" alt="screen after switching down to accessibilityExtraExtraLarge">
</td>
</tr>
<tr>
<td>
Screenshot when launched at <code>large</code>, the default size.
</td>
<td>
After changing to <code>accessibilityExtraExtraExtraLarge</code>.
</td>
<td>
After scaling down to <code>accessibilityExtraExtraLarge</code>.
</td>
</tr>
</table>

Related openradar bug report
----------------------------

- "Label with large title text style doesn't resize the font size when Dynamic Type setting changes", [rdar://43682426](http://openradar.appspot.com/43682426), [rdar://45338369](http://openradar.appspot.com/45338369)

