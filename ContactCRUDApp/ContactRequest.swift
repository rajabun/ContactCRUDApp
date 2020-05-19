//
//  ContactRequest.swift
//  ContactCRUDApp
//
//  Created by Muhammad Rajab Priharsanto on 20/05/20.
//  Copyright © 2020 Muhammad Rajab Priharsanto. All rights reserved.
//

import Foundation

enum ContactError:Error
{
    case noDataAvailable
    case canNotProcessData
}

struct ContactRequest
{
    var resourceURL: URL
    let contactAPI = "https://simple-contact-crud.herokuapp.com/contact"
    
    init()
    {
        guard let resourceURL = URL(string: contactAPI)
        else
        {
            fatalError()
        }
        self.resourceURL = resourceURL
        print("init berhasil")
    }
    
    func getData (completion: @escaping(Result<[ContactDetail], ContactError>) -> Void)
    {
        let dataTask = URLSession.shared.dataTask(with: resourceURL)
        {data,_,_ in
            guard let jsonData = data
            else
            {
                completion(.failure(.noDataAvailable))
                return
            }
            do
            {
                let decoder = JSONDecoder()
                //print("decoder berhasil")
                let contactResponse = try decoder.decode(ContactResponse.self, from: jsonData)
                //print("contactResponse berhasil")
                DispatchQueue.main.async
                {
                    let contactDetails = contactResponse.data
                    //print("contactDetails berhasil")
                    completion(.success(contactDetails))
                    print("completion berhasil")
                }
                
            }
            catch
            {
                completion(.failure(.canNotProcessData))
                print(error)
            }
        }
        dataTask.resume()
       print("getdata berhasil")
    }
}
