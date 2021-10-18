# GaugeProgressViewStyle

A progress view that visually indicates its progress using a gauge.

``` swift
public struct GaugeProgressViewStyle<S: ShapeStyle & View, LowerLabel: View, UpperLabel: View>: ProgressViewStyle 
```

## Inheritance

`ProgressViewStyle`

## Methods

### `makeBody(configuration:)`

Creates a view representing the body of a progress view.

``` swift
public func makeBody(configuration: Configuration) -> some View 
```

#### Parameters

  - configuration: The properties of the progress view being created.

#### Returns

A view representing the body of a progress view.
