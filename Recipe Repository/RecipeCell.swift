//
//  PostCell.swift
//  Recipe Repository
//
//  Created by Drishya Shrestha on 4/22/24.
//

import UIKit
protocol RecipeCellDelegate: AnyObject {
    func recipeCell(_ cell: RecipeCell, didTapFavoriteButton button: UIButton)
}

class RecipeCell: UITableViewCell {

    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    // Action for the favorite button
    @IBAction func didTapFavoriteButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        // Notify the delegate (HomeViewController) when the button is tapped
        delegate?.recipeCell(self, didTapFavoriteButton: sender)
    }
    
    // Delegate property
       weak var delegate: RecipeCellDelegate?
       
       
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
