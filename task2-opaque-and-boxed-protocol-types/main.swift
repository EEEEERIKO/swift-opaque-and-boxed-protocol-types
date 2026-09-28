//
//  main.swift
//  task2-opaque-and-boxed-protocol-types
//
//  Created by Erik Valencia Cardona on 28/09/26.
//

import Foundation

protocol Shape{
    func area() -> Double
    func perimeter() -> Double
}

class Circle: Shape {
    let radius: Double
    init(radius: Double){
        self.radius = radius
    }
    func area() -> Double{
        return 3.14 * radius * radius
    }
    func perimeter() -> Double{
        return 2 * 3.14 * radius
    }
}

class Rectangle: Shape {
    let base: Double
    let height: Double
    
    init(base: Double, height: Double){
        self.base = base
        self.height = height
    }
    
    func area() -> Double{
        return base * height
    }
    func perimeter() -> Double{
        return base * 2 + height * 2
    }
}


func generateShape() -> some Shape{
    return Circle(radius: 5)
}

func calculateShapeDetails(_ shape: any Shape) -> (area: Double, perimeter: Double){
    return (shape.area(),  shape.perimeter())
}


let shape = generateShape()

let details = calculateShapeDetails(shape)

print("Area: \(details.area)")
print("Perimeter: \(details.perimeter)")
