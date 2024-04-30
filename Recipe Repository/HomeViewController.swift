//
//  HomeViewController.swift
//  Recipe Repository
//
//  Created by Drishya Shrestha on 4/22/24.
//

import UIKit


class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var recipes: [Recipe] = []
    let recipeService = RecipeService()
    
    @IBOutlet weak var tableView: UITableView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Register the cell class with the table view
        tableView.register(RecipeCell.self, forCellReuseIdentifier: "RecipeCell")
        
        // Fetch recipes for a given query (e.g., "pasta")
        fetchRecipes(query: "recipes")
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
        let recipe = recipes[indexPath.row]
        
        // Customize the cell: set the title and load the image asynchronously
        cell.textLabel?.text = recipe.label
        
        if let imageUrl = URL(string: recipe.image) {
            // Load the image asynchronously using URLSession
            URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    cell.imageView?.image = UIImage(data: data)
                    cell.setNeedsLayout()
                }
            }.resume()
        }
        
        return cell
    }
    
    // MARK: - Fetch Recipes
    
    func fetchRecipes(query: String) {
        recipeService.fetchRecipes(query: query) { [weak self] result in
            switch result {
            case .success(let recipes):
                // Update the recipes and reload the table view
                self?.recipes = recipes
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                // Handle the error
                print("Failed to fetch recipes: \(error)")
            }
        }
    }
    
    
    
    
    
    
}
    
