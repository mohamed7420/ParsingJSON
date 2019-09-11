//
//  ViewController.swift
//  ParsingJSON
//
//  Created by Mohamed on 9/10/19.
//  Copyright © 2019 Mohamed74. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  // let url = "https://api.letsbuildthatapp.com/jsondecodable/course"
  //  let url = "https://api.letsbuildthatapp.com/jsondecodable/courses"
    
    //let url = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
    
    let url = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
    let session = URLSession.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let jsonURL = URL(string: url) else {return}
        
        
        
        session.dataTask(with: jsonURL) { (data, response, error) in
      
            if let data = data {
                
                DispatchQueue.main.async {
              
                    
                    do{
                        
                        // Mark:- simple way to parse json

                        
                        let dataModel = try JSONDecoder().decode([DataModel].self , from: data)
                        
                        print(dataModel)
                       
                        
//
//                        let jsonData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//
//                        let model = DataModel(json: jsonData as! [String : Any])
//
//                        print(model.imageUrl)
                        
                    }catch {
                        
                        print(error.localizedDescription)
                    }
                    
                }
                
            }
            
            }.resume()
        
        
    }
    
}

