//
//  AdminCourseModel.swift
//  AdminCoursesViewPOC
//
//  Created by Guru Mahan on 04/02/23.
//

import Foundation
import SwiftUI

struct AdminCourseCellModel: Identifiable{
    var id: String = UUID().uuidString
   // var starRating:[StarRatingModel] = []
    var sessionCount: Array<String> = []
    var rating =  3
  
    var isSelected = false
   
    var SessionCount = ["33","52"]
}

