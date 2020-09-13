//
//  Rx.swift
//  News
//
//  Created by Nguyen The Phuong on 9/13/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import RxSwift
import RxCocoa

public extension ObservableType {
    @inline(__always)
    func doNext(_ onNext: ((Self.Element) throws -> Void)?) -> Observable<Self.Element> {
        self.do(onNext: onNext)
    }

    @inline(__always)
    func subscribeNext(_ onNext: ((Self.Element) -> Void)?) -> Disposable {
        self.subscribe(onNext: onNext)
    }
}

public extension Driver {
    @inline(__always)
    func doNext(_ onNext: ((Self.Element) -> Void)?) -> RxCocoa.SharedSequence<Self.SharingStrategy, Self.Element> {
        self.do(onNext: onNext)
    }
}
