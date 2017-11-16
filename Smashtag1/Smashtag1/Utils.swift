//
//  Utils.swift
//  Smashtag1
//
//  Created by Gai Carmi on 10/3/17.
//  Copyright © 2017 Gai Carmi. All rights reserved.
//

import Foundation

class Utils: NSObject {

    public static let userDefaultRecentSearchesKey = "recentSearches"

    // store new search in User Default - so the data will be save between launches of the app
    static func storeTweetSearchInUserDefault(searchText searchTextToStore: String?) {
        
        let defaults = UserDefaults.standard
        var storedSearches = defaults.object(forKey: Utils.userDefaultRecentSearchesKey ) as? [String] ?? [String]()
        if let searchToStore = searchTextToStore {
            
            // maybe implement with dictionary will be better
            if !storedSearches.contains(searchToStore.lowercased()) {
                storedSearches.insert(searchToStore.lowercased(), at: 0)
            }
        }
        defaults.set(storedSearches, forKey: Utils.userDefaultRecentSearchesKey)        
    }
    
    static func removeTweetSearchFromUserDefault(searchText searchTextToDelete: String?) {
        let defaults = UserDefaults.standard
        var storedSearches = defaults.object(forKey: Utils.userDefaultRecentSearchesKey ) as? [String] ?? [String]()
        if let searchToDelete = searchTextToDelete {

            if storedSearches.contains(searchToDelete.lowercased()) {
                storedSearches.remove(at: storedSearches.index(of: searchToDelete.lowercased() )!)
            }
        }
        defaults.set(storedSearches, forKey: Utils.userDefaultRecentSearchesKey)
    }
//
//    static func removeTweetSearchFromUserDefault() {
//
//        let defaults = UserDefaults.standard
//        var storedSearches = defaults.object(forKey: Utils.userDefaultRecentSearchesKey ) as? [String] ?? [String]()
//
//        storedSearches.removeFirst()
//        defaults.set(storedSearches, forKey: Utils.userDefaultRecentSearchesKey)
//    }

}
