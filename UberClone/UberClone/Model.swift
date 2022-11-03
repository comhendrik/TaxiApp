//
//  Model.swift
//  UberClone
//
//  Created by Hendrik Steen on 15.10.22.
//

import Foundation
import CoreLocation
import SwiftUI

struct RideRequest {
    var rideType: DrivingMode
    var start: CLLocation
    var destination: CLLocation
    
    func sendRequest() -> [Drive] {
        //Normal Logic with Server Request to get real data
        
        //To test input the driver location is set to the destination which doesn't make sense in the normal use of the application but will be changed when real data is used.
        //Dummy data:,
        return [Drive(driver: Driver(firstName: "Max", lastName: "Mustermann", rating: 4.5, location: destination, car: Car(name: "Tesla Model 3", type: .standard)), cost: 12.99)]
    }
}

struct Drive: Identifiable {
    var id = UUID().uuidString
    var driver: Driver
    var cost: Double
    
    func bookDrive() -> DriveStatus {
        //Logic for book Drive
        
        //Send Notification to driver and add it to user
        //Dummy data:
        return .pending
    }
}

struct Driver {
    var firstName: String
    var lastName: String
    var rating: Double
    var location: CLLocation
    var car: Car
    
    func getDistanceFromUser(userLocation: CLLocation) -> Double {
        let distanceInMeters = location.distance(from: userLocation)
        return distanceInMeters / 1000
    }
}

struct Car {
    var name: String
    var type: DrivingMode
}

struct Location: Identifiable {
    let id: UUID
    var name: String
    var description: String
    let location: CLLocation
}

enum DriveStatus {
    case cancelled, success, pending, arriving, notBooked
    
    var responseValue: String {
        switch self {
        case .cancelled:
            return "Drive was cancelled."
        case .success:
            return "Drive finished"
        case .pending:
            return "pending..."
        case .arriving:
            return "Drive is arriving"
        case .notBooked:
            return "No booked Drive"
        }
    }
    
    var systemImage: String {
        switch self {
        case .cancelled:
            return "xmark.seal"
        case .success:
            return "checkmark.seal"
        case .pending:
            return "car.fill"
        case .arriving:
            return "car"
        case .notBooked:
            return "car"
        }
    }
        
    var systemImageColor: Color {
        switch self {
        case .cancelled:
            return .red
        case .success:
            return .green
        case .pending:
            return .gray
        case .arriving:
            return .green
        case .notBooked:
            return .red
        }
    }
}

enum DrivingMode: String, CaseIterable {
    
    case standard, medium, luxus
    
    var stringValue: String {
        switch self {
        case .standard:
            return "Standard"
        case .medium:
            return "Medium"
        case .luxus:
            return "Luxus"
        }
    }
    
    var image: String {
        "Car"
    }
    
    var price: Double {
        switch self {
        case .standard:
            return 10.99
        case .medium:
            return 15.99
        case .luxus:
            return 20.99
        }
    }
}
