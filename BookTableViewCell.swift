import UIKit
import Nuke

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    func configure(with book: Book) {
        titleLabel.text = book.title
        authorLabel.text = book.author
        descriptionLabel.text = book.description
        
        // Use ImagePipeline to load and display the image
        if let coverImageURL = URL(string: book.imageUrl) {
            let request = ImageRequest(url: coverImageURL)
            
            Nuke.ImagePipeline.shared.loadImage(
                with: request,
                progress: nil, // Handle image loading progress if needed
                completion: { [weak self] result in
                    guard let self = self else { return }
                    
                    switch result {
                    case .success(let response):
                        self.coverImageView.image = response.image
                    case .failure(let error):
                        // Handle image loading failure
                        print("Image loading error: \(error.localizedDescription)")
                    }
                }
            )
        }
    }
}
