//
//  SearchViewModel.swift
//  VirtualLearnApp
//
//  Created by Anusha on 16/04/22.
//

import Foundation
class SearchViewModel {
    
    let manager = SearchNetworkManager()
    var searchedCourses = [SearchCourseDataModel]()
    func searchSeralization(data: Any) -> [SearchCourseDataModel]{
        
        var cname: String = ""
        var totalch: Int = 0
        var category: String = ""
        
        let actualData = data as? [[String: Any]] ?? [["searchCourse":"error"]]
        
        for item in actualData {
            
            cname = item["courseName"] as? String ?? "no courseName"
            totalch = item["totalChapters"] as? Int ?? 0
            category = item["category"] as? String ?? "no category"
            
            let searchedCourse = SearchCourseDataModel(name: cname, totalChapters: totalch, category: category)
            searchedCourses.append(searchedCourse)
        }
        return searchedCourses
    }
    
    func searchCourse(name: String, category: String, totalChapters: Int, completionHandler: @escaping (_ searchData: [SearchCourseDataModel]) -> Void){
        manager.search(name: name, category: category, totalChapters: totalChapters, completionHandler: {
            (searchData: Any) -> Void
            in
            let searchArray = self.searchSeralization(data: searchData)
            completionHandler(searchArray)
            self.searchedCourses = []
        })
    }
}
