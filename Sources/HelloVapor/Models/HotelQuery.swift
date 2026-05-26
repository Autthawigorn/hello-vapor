//
//  HotelQuery.swift
//  HelloVapor
//
//  Created by Art Mac M5 on 26/5/2569 BE.
//

import Foundation
import Vapor

struct HotelQuery: Content {
    let sort: String?
    let search: String?
}
