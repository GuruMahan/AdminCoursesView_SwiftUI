//
//  AdminCoursesViewModel.swift
//  AdminCoursesViewPOC
//
//  Created by Guru Mahan on 04/02/23.
//

import Foundation

class AdminCoursesViewModel: ObservableObject {
    @Published var adminModelList:[AdminCourseCellModel] = []
    @Published var adminCourseIndex: Int?
   
    init() {
        
        adminModelList.append(createNewAdminCourse(index: questionCount))
        adminModelList.append(createNewAdminCourse(index: questionCount))
        adminModelList.append(createNewAdminCourse(index: questionCount))

    }
    
    var questionCount: Int {
        adminModelList.count
    }
    func createNewAdminCourse(index: Int) ->AdminCourseCellModel {
        
        let question =  createQuestion(session:["52","32"] )
//        for _ in 0..<1{
//
//
//
//        }
        return question
   
    }
   
    func indexOf(question: AdminCourseCellModel) -> Int? {
        adminModelList.lastIndex(where: { $0.id == question.id })
    }
    func createQuestion(session:[ String]) -> AdminCourseCellModel{
       
        var question = AdminCourseCellModel()
        question.sessionCount = session

        return question
    }
    func adminCourseIndexOf(adminCourseCell: AdminCourseCellModel) -> Int? {
        if let index =  adminModelList.lastIndex(where: { $0.id == adminCourseCell.id }){
            return index//adminModelList[index].starRating.lastIndex(where: {$0.id == starRating.id})
        }
     return nil
    }
}



