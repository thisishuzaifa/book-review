//
//  BookDetailViewController.swift
//  BookReview
//
//  Created by Muhammad Huzaifa Khalid on 2021-11-28.
//

import UIKit

class BookDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var books: Books?
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var detailsLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var notesCell: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.title = books?.title

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return books?.notes.count ?? 0
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notesCell", for: indexPath)
        cell.textLabel?.text = books?.notes[indexPath.row]
        
        detailsLabel.text = books?.title
        
        if let theUrl = books?.imageURL,
           let url = URL(string: theUrl),
           let data = try?Data(contentsOf: url)
        {
            imageView.image = UIImage(data: data)
            
        }
        return cell
    }
}



