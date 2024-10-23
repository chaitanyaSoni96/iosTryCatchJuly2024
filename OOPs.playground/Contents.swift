import Foundation

class Vehicle {
    let name: String
    var kilometersTraveled: Int = 0
    var isDirty: Bool = false
    
    init(name: String) {
        self.name = name
    }
    
    func move(distance: Int) {
        if distance > 0 {
            kilometersTraveled += distance
            isDirty = true
        }
    }
}

struct MotorcycleRider {
    var isWearingHelmet: Bool
}
class Motorcycle: Vehicle {
    
    var isRiderWearingHelmet: Bool = false
    
    override init(name: String) {
        super.init(name: "Motorcycle \(name)")
    }
    
    func mount(rider: MotorcycleRider) {
        isRiderWearingHelmet = rider.isWearingHelmet
    }
    
    override func move(distance: Int) {
        if isRiderWearingHelmet {
            super.move(distance: distance)
        } else {
            print("No Helment, no move")
        }
    }
}

class VehicleWash {
    
    init() {
        
    }
    
    func wash(vehicle: inout Vehicle) {
        vehicle.isDirty = false
    }
}

var vehicleWash = VehicleWash.init()
var maruti800 = Vehicle.init(name: "Maruti 800")

maruti800.move(distance: 700)
print(maruti800.isDirty)
vehicleWash.wash(vehicle: &maruti800)
print(maruti800.isDirty)

let rider = MotorcycleRider.init(isWearingHelmet: false)
let motorcycle = Motorcycle(name: "Pulsar 150")
motorcycle.mount(rider: rider)
motorcycle.move(distance: 10)
