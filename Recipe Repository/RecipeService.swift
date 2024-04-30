import Foundation

class RecipeService {
    let baseURL = "https://api.edamam.com/api/recipes/v2"
    let appId = "9339cd4d" // Replace with your app ID
    let appKey = "2bcc9cb26b779fc466fea52dd5ffdd01" // Replace with your app key
    
    func fetchRecipes(query: String, offset : Int = 0, completion: @escaping (Result<[Recipe], Error>) -> Void) {
        // Construct the URL with query parameters
        let urlString = "\(baseURL)?type=public&q=\(query)&app_id=\(appId)&app_key=\(appKey)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        // Create a data task to fetch data from the API
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                // Define the expected JSON response structure
                struct Response: Codable {
                    let hits: [RecipeHit]
                }
                
                struct RecipeHit: Codable {
                    let recipe: Recipe
                }
                
                // Decode the JSON data into the defined structure
                let response = try JSONDecoder().decode(Response.self, from: data)
                let recipes = response.hits.map { $0.recipe }
                completion(.success(recipes))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
