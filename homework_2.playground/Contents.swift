import UIKit

class Car {
    let mark: String
    var speed: Float = 0
    private(set) var carMode: String = "parking"
    
    func set(mode: CarMode) {
        guard isOn else { return }
        
        switch mode {
        case .sport:
            carMode = "sport"
            speed = 200
        case .parking:
            carMode = "parking"
            speed = 0
        case .drive:
            carMode = "drive"
            speed = 100
        }
    }
    
    var engine: Engine
    
    var gearNum: Int {
        switch speed {
        case 1...15:
            return 1
        case 16...30:
            return 2
        case 31...60:
            return 3
        case 61...90:
            return 4
        case 91...140:
            return 5
        case 140...Float(engine.maxNum):
            return 6
        default:
            return 0
        }
    }
    
    var isOn: Bool {
        return speed != 0
    }
    
    func display() {
        let displayShow = Display(isOnCar: isOn, mark: mark, speed: speed, mode: carMode, currentGear: gearNum)
        displayShow.showInfo()
    }
    
    
    init(_ mark: String, engine: Engine) {
        self.mark = mark
        self.engine = engine
    }
}


class Engine {
    var maxNum: Int
    var isWorkEngine: Bool = false
    
    init(maxNum: Int) {
        self.maxNum = maxNum
    }
}


class Display {
    let isOn: Bool
    let mark: String
    let speed: Float
    let mode: String
    let currentGear: Int
    
    init(isOnCar: Bool, mark: String, speed: Float, mode: String, currentGear: Int) {
        self.isOn = isOnCar
        self.mark = mark
        self.speed = speed
        self.mode = mode
        self.currentGear = currentGear
    }
    
    func showInfo() {
        guard isOn else {
            print("Sorry your car on the parking..")
            return
        }
        print("DISPLAY:")
        print("Car mark: \(mark)")
        print("speed: \(speed)")
        print("mode: \(mode)")
        print("Current Gear is \(currentGear)")
    }
}

enum CarMode {
    case sport
    case parking
    case drive
}

let engine = Engine(maxNum: 240)

let car = Car("BMW", engine: engine)
car.speed = 130
car.set(mode: .sport)
car.display()
car.engine.maxNum = 250


