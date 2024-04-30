//
//  DetailViewController.swift
//  Recipe Repository
//
//  Created by Drishya Shrestha on 4/29/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var posterImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ingredientsLabel: UILabel!

    @IBOutlet weak var instructionsLabel: UILabel!
    
    
    var recipe : Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayRecipeDetails()
        // Do any additional setup after loading the view.
    }
    
    func displayRecipeDetails(){
        guard let recipe = recipe else { return }
               
               // Set the navigation bar title
               title = recipe.label
               
               // Display recipe title
               titleLabel.text = recipe.label
               
               // Display ingredients
               ingredientsLabel.text = recipe.ingredientLines.joined(separator: "\n")
               
               // Display instructions (if available)
               instructionsLabel.text = recipe.instructions ?? "Instructions not available."
               
               // Load and display the recipe image
               if let imageUrl = URL(string: recipe.image) {
                   URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                       guard let data = data else { return }
                       DispatchQueue.main.async {
                           self.backgroundImage.image = UIImage(data: data)
                       }
                   }.resume()
               }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
