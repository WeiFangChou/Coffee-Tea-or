//
//  Coffee.swift
//  Coffee Tea or
//
//  Created by WeiFangChou on 2021/5/4.
//

import Foundation

struct Coffee : Codable{
    let id: String?
    let name :String?
    let city: String?
    let wifi: Float?
    let seat: Float?
    let quiet: Float?
    let tasty: Float?
    let cheap: Float?
    let music: Float?
    let url: String?
    let address: String?
    let latitude: String?
    let longitude: String?
    let limited_time: String?
    let socket: String?
    let standing_desk: String?
    let mrt: String?
    let open_time: String?
    
    init(id: String, name: String, city: String, wifi: Float, seat: Float, quiet: Float, tasty: Float, cheap: Float, music: Float, url: String, address: String, latitude: String, longitude: String, limited_time:String, socket: String, standing_desk: String, mrt: String, open_time: String) {
        self.id = id
        self.name = name
        self.city = city
        self.wifi = wifi
        self.seat = seat
        self.quiet = quiet
        self.tasty = tasty
        self.cheap = cheap
        self.music = music
        self.url = url
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.limited_time = limited_time
        self.socket = socket
        self.standing_desk = standing_desk
        self.mrt = mrt
        self.open_time = open_time
    }
}
