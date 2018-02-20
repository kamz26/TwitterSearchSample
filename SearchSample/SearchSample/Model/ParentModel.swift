//
//  ParentModel.swift
//  SearchSample
//
//  Created by Abhishek K on 19/02/18.
//  Copyright © 2018 Abhishek K. All rights reserved.
//

import Foundation

class ParentModel {
    var statuses:[Tweets] 
    var search_metadata:MetaData
    
    init(searchData:MetaData,statuses:[Tweets]) {
        self.search_metadata = searchData
        self.statuses = statuses
    }
}
