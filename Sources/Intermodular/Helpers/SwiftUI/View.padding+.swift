//
// Copyright (c) Vatsal Manot
//

import Swift
import SwiftUI

public enum _PaddingAmount: CaseIterable, Hashable {
    case small
    case regular
    case large
}

extension View {
    /// A view that pads this view inside the specified edge insets with a
    /// system-calculated amount of padding.
    ///
    /// Use `padding(_:)` to add a system-calculated amount of padding inside
    /// one or more of the view's edges by passing either a single edge name, or
    /// an `OptionSet` describing which edges should be padded. For example you
    /// can add padding to the bottom of a text view:
    ///
    /// - Parameters:
    ///   - edges: The set of edges along which to pad this view; if `nil` the
    ///     specified or system-calculated mount is applied to all edges.
    ///   - amount: The amount to inset this view on the specified edges. If
    ///     `nil`, the amount is the system-default amount.
    ///
    /// - Returns: A view that pads this view using the specified edge insets
    ///   with specified amount of padding.
    @ViewBuilder
    public func padding(
        _ edges: Edge.Set = .all,
        _ amount: _PaddingAmount?
    ) -> some View {
        switch amount {
            case .none:
                padding(edges)
            case .some(.small):
                padding(edges, 8)
            case .some(.regular):
                padding(edges)
            case .some(.large):
                padding(edges).padding(edges)
        }
    }
}
