import UIKit
import Nuke

class BookListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateBookData()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set up table view properties
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
    }
    
    func populateBookData() {
        books.append(Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", description: "A novel about the American Dream.", imageUrl: "https://covers.openlibrary.org/b/id/6979861-L.jpg"))
        books.append(Book(title: "To Kill a Mockingbird", author: "Harper Lee", description: "A story of racial injustice and loss of innocence.", imageUrl: "https://covers.openlibrary.org/b/id/8265320-L.jpg"))
        books.append(Book(title: "Pride and Prejudice", author: "Jane Austen", description: "A romantic novel of manners.", imageUrl: "https://covers.openlibrary.org/b/id/8265282-L.jpg"))
        books.append(Book(title: "1984", author: "George Orwell", description: "A dystopian novel depicting totalitarian society.", imageUrl: "https://covers.openlibrary.org/b/id/8266498-L.jpg"))
        books.append(Book(title: "Moby Dick", author: "Herman Melville", description: "A novel about the voyage of the whaling ship Pequod.", imageUrl: "https://covers.openlibrary.org/b/id/8265256-L.jpg"))
        books.append(Book(title: "Jane Eyre", author: "Charlotte Brontë", description: "A classic novel of romance and mystery.", imageUrl: "https://covers.openlibrary.org/b/id/8265300-L.jpg"))
        books.append(Book(title: "The Catcher in the Rye", author: "J.D. Salinger", description: "A story of teenage rebellion and alienation.", imageUrl: "https://covers.openlibrary.org/b/id/8265333-L.jpg"))
        books.append(Book(title: "The Hobbit", author: "J.R.R. Tolkien", description: "A fantasy novel about the journey of Bilbo Baggins.", imageUrl: "https://covers.openlibrary.org/b/id/8265111-L.jpg"))
        books.append(Book(title: "Brave New World", author: "Aldous Huxley", description: "A novel exploring a dystopian future.", imageUrl: "https://covers.openlibrary.org/b/id/8266492-L.jpg"))
        books.append(Book(title: "The Grapes of Wrath", author: "John Steinbeck", description: "A novel depicting the struggles of migrant workers during the Great Depression.", imageUrl: "https://covers.openlibrary.org/b/id/8265274-L.jpg"))
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookTableViewCell
        
        let book = books[indexPath.row]
        cell.configure(with: book)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "BookDetailSegue", sender: indexPath)
    }
    
    // MARK: - Navigation
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BookDetailSegue", let indexPath = sender as? IndexPath {
            let selectedBook = books[indexPath.row]
            if let bookDetailVC = segue.destination as? BookDetailViewController {
                bookDetailVC.selectedBook = selectedBook
            }
        }
    }*/
}
