//
//  File.swift
//  FileView
//
//  Created by Jigyasaa Sood on 12/18/20.
//

import Foundation

class File{
    var filename: String
    var description: String
    var createdDate: String
    var url:URL
        
        init(dictionary: [String: Any]) {
            filename = dictionary["filename"] as? String ?? "No filename"
            description = dictionary["description"] as? String ?? "No Description"
            
            let urlString = dictionary["url"] as! String
            let baseURLString = "https://s3-us-west-2.amazonaws.com/android-task/"
            url = URL(string: baseURLString + urlString)!
            
            //convert milliseconds epoch time to date and time
            let uploadedAtNum = dictionary["uploadedAt"] as! TimeInterval
            let date = Date(timeIntervalSince1970: uploadedAtNum)
            
            // US English Locale (en_US)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.medium
            dateFormatter.timeStyle = DateFormatter.Style.none
            dateFormatter.locale = NSLocale.current
            let dateString = dateFormatter.string(from: date) // Dec 18, 2020
            
            createdDate = dateString
            
        }
        
        func files(dictionaries: [[String: Any]]) -> [File] {
            var files: [File] = []
            for dictionary in dictionaries {
                let file = File(dictionary: dictionary)
                files.append(file)
            }
            
            return files
        }
}
