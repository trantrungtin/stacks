open ReactNative

open Stacks_hooks
open Stacks_utils

@react.component
let make = (
  // Stack props
  ~space=?,
  ~align=?,
  // View props
  // ~accessibilityActions=?,
  ~accessibilityComponentType=?,
  ~accessibilityElementsHidden=?,
  ~accessibilityHint=?,
  ~accessibilityIgnoresInvertColors=?,
  ~accessibilityLabel=?,
  ~accessibilityLiveRegion=?,
  ~accessibilityRole=?,
  ~accessibilityState=?,
  ~accessibilityTraits=?,
  ~accessibilityValue=?,
  ~accessibilityViewIsModal=?,
  ~accessible=?,
  ~collapsable=?,
  ~hitSlop=?,
  ~importantForAccessibility=?,
  ~nativeID=?,
  ~needsOffscreenAlphaCompositing=?,
  ~onAccessibilityEscape=?,
  ~onAccessibilityTap=?,
  ~onLayout=?,
  ~onMagicTap=?,
  ~onMoveShouldSetResponder=?,
  ~onMoveShouldSetResponderCapture=?,
  ~onResponderEnd=?,
  ~onResponderGrant=?,
  ~onResponderMove=?,
  ~onResponderReject=?,
  ~onResponderRelease=?,
  ~onResponderStart=?,
  ~onResponderTerminate=?,
  ~onResponderTerminationRequest=?,
  ~onStartShouldSetResponder=?,
  ~onStartShouldSetResponderCapture=?,
  ~pointerEvents=?,
  ~removeClippedSubviews=?,
  ~renderToHardwareTextureAndroid=?,
  ~shouldRasterizeIOS=?,
  ~style=?,
  ~testID=?,
  ~children,
  // React Native Web props
  ~onMouseDown=?,
  ~onMouseEnter=?,
  ~onMouseLeave=?,
  ~onMouseMove=?,
  ~onMouseOver=?,
  ~onMouseOut=?,
  ~onMouseUp=?,
) => {
  let (space, align) = useResponsiveProp2(space, align)
  let space = useSpacing(space)
  let debugStyle = useDebugStyle()
  let style = Style.arrayOption([Some(styles["fullWidth"]), resolveDirection(Some(#column)), style])
  let children = React.Children.toArray(children)
  let isLast = isLastElement(children)

  <View
    ?accessibilityComponentType
    ?accessibilityElementsHidden
    ?accessibilityHint
    ?accessibilityIgnoresInvertColors
    ?accessibilityLabel
    ?accessibilityLiveRegion
    ?accessibilityRole
    ?accessibilityState
    ?accessibilityTraits
    ?accessibilityValue
    ?accessibilityViewIsModal
    ?accessible
    ?collapsable
    ?hitSlop
    ?importantForAccessibility
    ?nativeID
    ?needsOffscreenAlphaCompositing
    ?onAccessibilityEscape
    ?onAccessibilityTap
    ?onLayout
    ?onMagicTap
    ?onMoveShouldSetResponder
    ?onMoveShouldSetResponderCapture
    ?onResponderEnd
    ?onResponderGrant
    ?onResponderMove
    ?onResponderReject
    ?onResponderRelease
    ?onResponderStart
    ?onResponderTerminate
    ?onResponderTerminationRequest
    ?onStartShouldSetResponder
    ?onStartShouldSetResponderCapture
    ?pointerEvents
    ?removeClippedSubviews
    ?renderToHardwareTextureAndroid
    ?shouldRasterizeIOS
    ?testID
    ?onMouseDown
    ?onMouseEnter
    ?onMouseLeave
    ?onMouseMove
    ?onMouseOver
    ?onMouseOut
    ?onMouseUp
    style>
    {Js.Array2.mapi(children, (child, index) => {
      <View
        key={index |> string_of_int}
        style={Style.arrayOption([
          Some(styles["fullWidth"]),
          resolveAlignItemsX(align),
          debugStyle,
          isLast(index) ? None : Some(marginBottom(. space)),
        ])}>
        child
      </View>
    }) |> React.array}
  </View>
}
