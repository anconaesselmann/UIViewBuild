//  Created by Axel Ancona Esselmann on 2/9/20.
//  Copyright © 2020 Axel Ancona Esselmann. All rights reserved.
//

import UIKit
import Tuple

public protocol Viewable where T: UIView {
    associatedtype T
    func getView() -> T
}

extension UIView: Viewable {
    public typealias T = Self

    public func getView() -> T {
        return self as! T
    }
}

extension UIViewController: Viewable {
    public func getView() -> UIView {
        return view.getView()
    }
}

extension UIView {

    static public func createSubviews<V1>(_ creation: () -> V1) -> OneSubview<V1> {
        return OneSubview(subviews: creation())
    }

    static public func createSubviews<V1, Container>(_ creationCallback: @escaping (Container) -> V1, with container: Container) -> OneSubview<V1> {
        return OneSubview(subviews: creationCallback(container))
    }

    static public func createSubviews<V1, V2>(_ creation: () -> (V1, V2)) -> TwoSubviews<V1, V2> {
        return TwoSubviews(subviews: creation())
    }

    static public func createSubviews<V1, V2, Container>(_ creationCallback: @escaping (Container) -> (V1, V2), with container: Container) -> TwoSubviews<V1, V2> {
        return TwoSubviews(subviews: creationCallback(container))
    }

    static public func createSubviews<V1, V2, V3>(_ creation: () -> (V1, V2, V3)) -> ThreeSubviews<V1, V2, V3> {
        return ThreeSubviews(subviews: creation())
    }

    static public func createSubviews<V1, V2, V3, Container>(_ creationCallback: @escaping (Container) -> (V1, V2, V3), with container: Container) -> ThreeSubviews<V1, V2, V3> {
        return ThreeSubviews(subviews: creationCallback(container))
    }

    static public func createSubviews<V1, V2, V3, V4>(_ creation: () -> (V1, V2, V3, V4)) -> FourSubviews<V1, V2, V3, V4> {
        return FourSubviews(subviews: creation())
    }

    static public func createSubviews<V1, V2, V3, V4, Container>(_ creationCallback: @escaping (Container) -> (V1, V2, V3, V4), with container: Container) -> FourSubviews<V1, V2, V3, V4> {
        return FourSubviews(subviews: creationCallback(container))
    }

    static public func createSubviews<V1, V2, V3, V4, V5>(_ creationCallback: @escaping () -> (V1, V2, V3, V4, V5)) -> FiveSubviews<V1, V2, V3, V4, V5> {
        return FiveSubviews(subviews: creationCallback())
    }

    static public func createSubviews<V1, V2, V3, V4, V5, Container>(_ creationCallback: @escaping (Container) -> (V1, V2, V3, V4, V5), with container: Container) -> FiveSubviews<V1, V2, V3, V4, V5> {
        return FiveSubviews(subviews: creationCallback(container))
    }

    static public func createSubviews<V1, V2, V3, V4, V5, V6>(_ creationCallback: @escaping () -> (V1, V2, V3, V4, V5, V6)) -> SixSubviews<V1, V2, V3, V4, V5, V6> {
        return SixSubviews(subviews: creationCallback())
    }

    static public func createSubviews<V1, V2, V3, V4, V5, V6, Container>(_ creationCallback: @escaping (Container) -> (V1, V2, V3, V4, V5, V6), with container: Container) -> SixSubviews<V1, V2, V3, V4, V5, V6> {
        return SixSubviews(subviews: creationCallback(container))
    }
}

public class OneSubview<V1> where V1: Viewable {

    public typealias TupleElement = V1
    public typealias ViewTupleElement = (UIView, V1)

    let containerView: UIView
    let tuple: TupleElement

    fileprivate init(view: UIView = UIView(), subviews: TupleElement) {
        containerView = view
        self.tuple = subviews
    }

    public func layout(_ layoutCallback: @escaping (UIView, TupleElement) -> Void) -> UIView {
        layoutCallback(containerView, tuple)
        return containerView
    }

    public func layout(_ layoutCallback: @escaping (UIView, TupleElement) -> Void) -> Self {
        layoutCallback(containerView, tuple)
        return self
    }

    public func layout(_ layoutCallback: @escaping (UIView, TupleElement) -> Void) -> ViewTupleElement {
        layoutCallback(containerView, tuple)
        return Tuple.prepend(value: containerView, toTuple: tuple)
    }

    public func bind<ViewController>(_ bindingCallback: (ViewController, TupleElement) -> Void, with vc: ViewController) -> UIView where ViewController: UIViewController {
        bindingCallback(vc, tuple)
        return containerView
    }

    public func bind<ViewController>(_ bindingCallback: (ViewController, TupleElement) -> Void, with vc: ViewController) -> ViewTupleElement where ViewController: UIViewController {
        bindingCallback(vc, tuple)
        return Tuple.prepend(value: containerView, toTuple: tuple)
    }

    public func bind<ViewController, ViewModel>(_ bindingCallback: (ViewController, ViewModel, TupleElement) -> Void, with vc: ViewController, viewModel: ViewModel) -> ViewTupleElement where ViewController: UIViewController {
        bindingCallback(vc, viewModel, tuple)
        return Tuple.prepend(value: containerView, toTuple: tuple)
    }
}

public class TwoSubviews<V1, V2> where V1: Viewable, V2: Viewable {

    public typealias TupleElement = (V1, V2)
    public typealias ViewTupleElement = (UIView, V1, V2)

    let containerView: UIView
    let tuple: TupleElement

    fileprivate init(view: UIView = UIView(), subviews: TupleElement) {
        containerView = view
        self.tuple = subviews
    }

    public func layout(_ layoutCallback: @escaping (UIView, TupleElement) -> Void) -> UIView {
        layoutCallback(containerView, tuple)
        return containerView
    }

    public func layout(_ layoutCallback: @escaping (UIView, TupleElement) -> Void) -> Self {
        layoutCallback(containerView, tuple)
        return self
    }

    public func layout(_ layoutCallback: @escaping (UIView, TupleElement) -> Void) -> ViewTupleElement {
        layoutCallback(containerView, tuple)
        return Tuple.prepend(value: containerView, toTuple: tuple)
    }

    public func bind<ViewController>(_ bindingCallback: (ViewController, TupleElement) -> Void, with vc: ViewController) -> UIView where ViewController: UIViewController {
        bindingCallback(vc, tuple)
        return containerView
    }

    public func bind<ViewController>(_ bindingCallback: (ViewController, TupleElement) -> Void, with vc: ViewController) -> ViewTupleElement where ViewController: UIViewController {
        bindingCallback(vc, tuple)
        return Tuple.prepend(value: containerView, toTuple: tuple)
    }

    public func bind<ViewController, ViewModel>(_ bindingCallback: (ViewController, ViewModel, TupleElement) -> Void, with vc: ViewController, viewModel: ViewModel) -> ViewTupleElement where ViewController: UIViewController {
        bindingCallback(vc, viewModel, tuple)
        return Tuple.prepend(value: containerView, toTuple: tuple)
    }
}

public class ThreeSubviews<V1, V2, V3> where V1: Viewable, V2: Viewable, V3: Viewable {

    public typealias TupleElement = (V1, V2, V3)
    public typealias ViewTupleElement = (UIView, V1, V2, V3)

    let containerView: UIView
    let tuple: TupleElement

    fileprivate init(view: UIView = UIView(), subviews: TupleElement) {
        containerView = view
        self.tuple = subviews
    }

    public func layout(_ layoutCallback: @escaping (UIView, TupleElement) -> Void) -> UIView {
        layoutCallback(containerView, tuple)
        return containerView
    }

    public func layout(_ layoutCallback: @escaping (UIView, TupleElement) -> Void) -> Self {
        layoutCallback(containerView, tuple)
        return self
    }

    public func layout(_ layoutCallback: @escaping (UIView, TupleElement) -> Void) -> ViewTupleElement {
        layoutCallback(containerView, tuple)
        return Tuple.prepend(value: containerView, toTuple: tuple)
    }

    public func bind<ViewController>(_ bindingCallback: (ViewController, TupleElement) -> Void, with vc: ViewController) -> UIView where ViewController: UIViewController {
        bindingCallback(vc, tuple)
        return containerView
    }

    public func bind<ViewController>(_ bindingCallback: (ViewController, TupleElement) -> Void, with vc: ViewController) -> ViewTupleElement where ViewController: UIViewController {
        bindingCallback(vc, tuple)
        return Tuple.prepend(value: containerView, toTuple: tuple)
    }

    public func bind<ViewController, ViewModel>(_ bindingCallback: (ViewController, ViewModel, TupleElement) -> Void, with vc: ViewController, viewModel: ViewModel) -> ViewTupleElement where ViewController: UIViewController {
        bindingCallback(vc, viewModel, tuple)
        return Tuple.prepend(value: containerView, toTuple: tuple)
    }
}

public class FourSubviews<V1, V2, V3, V4> where V1: Viewable, V2: Viewable, V3: Viewable, V4: Viewable {

    public typealias TupleElement = (V1, V2, V3, V4)
    public typealias ViewTupleElement = (UIView, V1, V2, V3, V4)

    let containerView: UIView
    let tuple: TupleElement

    fileprivate init(view: UIView = UIView(), subviews: TupleElement) {
        containerView = view
        self.tuple = subviews
    }

    public func layout(_ layoutCallback: @escaping (UIView, TupleElement) -> Void) -> UIView {
        layoutCallback(containerView, tuple)
        return containerView
    }

    public func layout(_ layoutCallback: @escaping (UIView, TupleElement) -> Void) -> Self {
        layoutCallback(containerView, tuple)
        return self
    }

    public func layout(_ layoutCallback: @escaping (UIView, TupleElement) -> Void) -> ViewTupleElement {
        layoutCallback(containerView, tuple)
        return Tuple.prepend(value: containerView, toTuple: tuple)
    }

    public func bind<ViewController>(_ bindingCallback: (ViewController, TupleElement) -> Void, with vc: ViewController) -> UIView where ViewController: UIViewController {
        bindingCallback(vc, tuple)
        return containerView
    }

    public func bind<ViewController>(_ bindingCallback: (ViewController, TupleElement) -> Void, with vc: ViewController) -> ViewTupleElement where ViewController: UIViewController {
        bindingCallback(vc, tuple)
        return Tuple.prepend(value: containerView, toTuple: tuple)
    }

    public func bind<ViewController, ViewModel>(_ bindingCallback: (ViewController, ViewModel, TupleElement) -> Void, with vc: ViewController, viewModel: ViewModel) -> ViewTupleElement where ViewController: UIViewController {
        bindingCallback(vc, viewModel, tuple)
        return Tuple.prepend(value: containerView, toTuple: tuple)
    }
}

public class FiveSubviews<V1, V2, V3, V4, V5> where V1: Viewable, V2: Viewable, V3: Viewable, V4: Viewable, V5: Viewable {

    public typealias TupleElement = (V1, V2, V3, V4, V5)
    public typealias ViewTupleElement = (UIView, V1, V2, V3, V4, V5)

    let containerView: UIView
    let tuple: TupleElement

    fileprivate init(view: UIView = UIView(), subviews: TupleElement) {
        containerView = view
        self.tuple = subviews
    }

    public func layout(_ layoutCallback: @escaping (UIView, TupleElement) -> Void) -> UIView {
        layoutCallback(containerView, tuple)
        return containerView
    }

    public func layout(_ layoutCallback: @escaping (UIView, TupleElement) -> Void) -> Self {
        layoutCallback(containerView, tuple)
        return self
    }

    public func layout(_ layoutCallback: @escaping (UIView, TupleElement) -> Void) -> ViewTupleElement {
        layoutCallback(containerView, tuple)
        return Tuple.prepend(value: containerView, toTuple: tuple)
    }

    public func bind<ViewController>(_ bindingCallback: (ViewController, TupleElement) -> Void, with vc: ViewController) -> UIView where ViewController: UIViewController {
        bindingCallback(vc, tuple)
        return containerView
    }

    public func bind<ViewController>(_ bindingCallback: (ViewController, TupleElement) -> Void, with vc: ViewController) -> ViewTupleElement where ViewController: UIViewController {
        bindingCallback(vc, tuple)
        return Tuple.prepend(value: containerView, toTuple: tuple)
    }

    public func bind<ViewController, ViewModel>(_ bindingCallback: (ViewController, ViewModel, TupleElement) -> Void, with vc: ViewController, viewModel: ViewModel) -> ViewTupleElement where ViewController: UIViewController {
        bindingCallback(vc, viewModel, tuple)
        return Tuple.prepend(value: containerView, toTuple: tuple)
    }
}

public class SixSubviews<V1, V2, V3, V4, V5, V6> where V1: Viewable, V2: Viewable, V3: Viewable, V4: Viewable, V5: Viewable, V6: Viewable {

    public typealias TupleElement = (V1, V2, V3, V4, V5, V6)
    public typealias ViewTupleElement = (UIView, V1, V2, V3, V4, V5, V6)

    let containerView: UIView
    let tuple: TupleElement

    fileprivate init(view: UIView = UIView(), subviews: TupleElement) {
        containerView = view
        self.tuple = subviews
    }

    public func layout(_ layoutCallback: @escaping (UIView, TupleElement) -> Void) -> UIView {
        layoutCallback(containerView, tuple)
        return containerView
    }

    public func layout(_ layoutCallback: @escaping (UIView, TupleElement) -> Void) -> Self {
        layoutCallback(containerView, tuple)
        return self
    }

    public func layout(_ layoutCallback: @escaping (UIView, TupleElement) -> Void) -> ViewTupleElement {
        layoutCallback(containerView, tuple)
        return Tuple.prepend(value: containerView, toTuple: tuple)
    }

    public func bind<ViewController>(_ bindingCallback: (ViewController, TupleElement) -> Void, with vc: ViewController) -> UIView where ViewController: UIViewController {
        bindingCallback(vc, tuple)
        return containerView
    }

    public func bind<ViewController>(_ bindingCallback: (ViewController, TupleElement) -> Void, with vc: ViewController) -> ViewTupleElement where ViewController: UIViewController {
        bindingCallback(vc, tuple)
        return Tuple.prepend(value: containerView, toTuple: tuple)
    }

    public func bind<ViewController, ViewModel>(_ bindingCallback: (ViewController, ViewModel, TupleElement) -> Void, with vc: ViewController, viewModel: ViewModel) -> ViewTupleElement where ViewController: UIViewController {
        bindingCallback(vc, viewModel, tuple)
        return Tuple.prepend(value: containerView, toTuple: tuple)
    }
}
