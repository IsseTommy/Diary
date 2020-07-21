//
//  Diary.swift
//  Diary
//
//  Created by Tommy on 2020/07/21.
//  Copyright © 2020 Tommy. All rights reserved.
//

import Foundation
import RealmSwift

class Diary: Object {
    @objc dynamic var date = ""
    @objc dynamic var title = ""
    @objc dynamic var content = ""
}
