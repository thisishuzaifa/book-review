//
//  Books.swift
//  BookReview
//
//  Created by Muhammad Huzaifa Khalid on 2021-11-28.
//

import Foundation


class Books{
    
    var title: String
    var notes: [String]
    var imageURL: String
    var ISBN: String
    var author: String
    
    init(title: String, notes: [String], imageURL: String, ISBN: String, author: String){
        self.title = title
        self.notes = notes
        self.imageURL = imageURL
        self.ISBN = ISBN
        self.author = author
    }
}
