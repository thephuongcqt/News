//
//  RegisterViewModel.swift
//  News
//
//  Created by Nguyen The Phuong on 9/13/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import Foundation
import RxSwift

struct RegisterViewModel: ViewModelType {
    struct Input {
        let username: Observable<String>
        let keyword: Observable<String>
        let registerTrigger: Observable<Void>
    }
    
    struct Output {
        let enableButton: Observable<Bool>
        let toMainTrigger: Observable<Void>
    }
    
    func transform(input: Input) -> Output {
        let inputData = Observable.combineLatest(input.username, input.keyword).share()
        let validInput = inputData.map { username, keyword -> Bool in
            username.count > 0
        }
        let toMainTrigger = inputData.flatMapLatest { data in
                input.registerTrigger.map { data }
            }
            .map { username, keyword -> Void in
                self.insertUser(with: username, keyword: keyword)
            }
        
        return Output(
            enableButton: validInput,
            toMainTrigger: toMainTrigger
        )
    }
    
    func insertUser(with username: String, keyword: String) {        
        let user = User(context: CoreDataManager.shared.persistentContainer.viewContext)
        user.username = username
        user.category = keyword
        try? CoreDataManager.shared.saveContext()
    }
}
