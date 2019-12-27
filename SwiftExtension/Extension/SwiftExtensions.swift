//
// Created by Jeffrey Wei on 2019/12/27.
// Copyright (c) 2019 Jeffrey Wei. All rights reserved.
//

import Foundation
import RxSwift

extension Sequence {
    //Collection转信号,例如数组转信号,会一个一个发送数据,后面就可以继续使用RxSwift的各种操作符
    func toObservable() -> Observable<Element> {
        Observable<Element>.create { observer in
            self.forEach { (value: Element) in
                observer.onNext(value)
            }
            observer.onCompleted()
            return Disposables.create()
        }
    }
}

//其实就是Single
extension PrimitiveSequenceType where Trait == SingleTrait {
    //信号转变为值
    func toValue() -> Element {
        var result: Element?
        self.subscribe(onSuccess: { value in
            result = value
        }).disposed(by: DisposeBag())
        guard let finalResult = result else {
            fatalError("不会到此处,因为前面的订阅和观察在同一个线程,如果到,请查实")
        }
        return finalResult
    }
}

extension PrimitiveSequenceType where Trait == CompletableTrait, Element == Swift.Never {
    ///直接通过闭包创建Completable
    static func create(action: @escaping () -> Void) -> Completable {
        Completable.create { observer in
            action()
            observer(.completed)
            return Disposables.create()
        }
    }

    ///直接闭包来andThen操作
    func andThen(action: @escaping () -> Void) -> Completable {
        self.andThen(Completable.create(action: action))
    }
}
