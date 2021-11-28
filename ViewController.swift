//
//  ViewController.swift
//  BookReview
//
//  Created by Muhammad Huzaifa Khalid on 2021-11-28.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    let books = [
        Books(title:"The Alchemist", notes: ["This is probably my favourite book. A recommended read for sure. Really takes you into a different world", "Ratings: ⭐️ ⭐️ ⭐️ ⭐️ ⭐️"], imageURL: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1466865542i/18144590._UY2404_SS2404_.jpg", ISBN: "0062315005", author: "Paulo Coehlo"),
        
        Books(title:"The Great Gatsby", notes: ["A classic romance novel. Character progression is top notch", "Ratings: ⭐️ ⭐️ ⭐️ ⭐️ "], imageURL:" https://upload.wikimedia.org/wikipedia/commons/7/7a/The_Great_Gatsby_Cover_1925_Retouched.jpg",ISBN:"9780020198819", author:"F. Scott Fitzgerald"),
        Books(title:"Lord of the Rings", notes: ["Hands down best fantasy book. Must read for anyone who is a fan of fiction", "Ratings: ⭐️ ⭐️ ⭐️ ⭐️"], imageURL: " https://images-na.ssl-images-amazon.com/images/I/71v4v2E4oJL.jpg", ISBN: "9788845292613", author: "J.R.R Tolkein")
    
    ]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // We are setting the number of
    return books.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
        
        let books = books[indexPath.row]
            if let url = URL(string: books.imageURL),
               let data = try?Data(contentsOf: url){
                cell.imageView?.image = UIImage(data: data)
            }
        
        
        return cell}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let bookDetailViewController = segue.destination as? BookDetailViewController,
    let index = tableView.indexPathForSelectedRow?.row {
    bookDetailViewController.books = books[index]
    }

    
    
}

}
