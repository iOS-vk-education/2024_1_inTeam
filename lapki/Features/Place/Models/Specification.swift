//
//  Specification.swift
//  lapki
//
//  Created by Maxim Makarenkov on 09.01.2025.
//

protocol Specification {
    associatedtype Item
    func isSatisfied(by item: Item) -> Bool
}

struct PlaceNameSpecification : Specification {
    typealias Item = Place
    let keyword: String
    func isSatisfied(by item: Place) -> Bool {
        return item.name.lowercased().contains(keyword.lowercased())
    }
}

struct PlaceTypeSpecification : Specification {
    typealias Item = Place
    let type: PlaceType
    func isSatisfied(by item: Place) -> Bool {
        return item.type == type
    }
}

struct PlaceFavouriteSpecification : Specification {
    typealias Item = Place
    func isSatisfied(by item: Place) -> Bool {
        return item.isFavourite == true
    }
}

struct AndSpecification<T: Specification>: Specification {
    typealias U = T.Item
    let specifications: [T]
    
    func isSatisfied(by item: U) -> Bool {
        return specifications.allSatisfy { $0.isSatisfied(by: item) }
    }
}

struct OrSpecification<T: Specification>: Specification {
    typealias U = T.Item
    let specifications: [T]

    func isSatisfied(by item: U) -> Bool {
        return specifications.contains { $0.isSatisfied(by: item) }
    }
}
