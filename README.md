# Swift Opaque and Boxed Protocol Types

A Swift exercise focused on **protocol-oriented programming**, **opaque return types**, and **existential (boxed) protocol types**.

The project implements a generic `Shape` protocol with concrete `Circle` and `Rectangle` types, demonstrating how Swift can abstract concrete implementations while preserving type safety.

## 📌 Features

* Defines a `Shape` protocol with `area()` and `perimeter()` methods.
* Implements `Circle` and `Rectangle` conforming to `Shape`.
* Uses `some Shape` to return an opaque type from `generateShape()`.
* Uses `any Shape` to accept any type conforming to the `Shape` protocol.
* Returns shape calculations using a named tuple.
* Demonstrates protocol abstraction and type erasure through Swift's existential types.

## 🧩 Core Implementation

### Shape Protocol

```swift
protocol Shape {
    func area() -> Double
    func perimeter() -> Double
}
```

The protocol establishes a common interface that every shape must implement.

### Circle

```swift
class Circle: Shape {
    let radius: Double

    init(radius: Double) {
        self.radius = radius
    }

    func area() -> Double {
        return 3.14 * radius * radius
    }

    func perimeter() -> Double {
        return 2 * 3.14 * radius
    }
}
```

### Rectangle

```swift
class Rectangle: Shape {
    let base: Double
    let height: Double

    init(base: Double, height: Double) {
        self.base = base
        self.height = height
    }

    func area() -> Double {
        return base * height
    }

    func perimeter() -> Double {
        return base * 2 + height * 2
    }
}
```

## 🔐 Opaque Return Type — `some Shape`

The `generateShape()` function uses an opaque return type:

```swift
func generateShape() -> some Shape {
    return Circle(radius: 5)
}
```

`some Shape` means that the function returns a specific concrete type that conforms to `Shape`, while hiding that concrete type from the caller.

In this implementation, the underlying type is `Circle`.

```text
generateShape()
      ↓
Circle(radius: 5)
      ↓
some Shape
```

This provides abstraction while preserving the concrete type information internally.

## 📦 Existential / Boxed Protocol Type — `any Shape`

The `calculateShapeDetails()` function accepts an existential protocol value:

```swift
func calculateShapeDetails(
    _ shape: any Shape
) -> (area: Double, perimeter: Double) {
    return (shape.area(), shape.perimeter())
}
```

Using `any Shape` allows the function to receive **any concrete type that conforms to `Shape`**, such as `Circle` or `Rectangle`.

This demonstrates the distinction between:

* `some Shape` → opaque return type with one hidden concrete type.
* `any Shape` → existential value capable of holding different conforming types.

## 🧪 Example

```swift
let shape = generateShape()

let details = calculateShapeDetails(shape)

print("Area: \(details.area)")
print("Perimeter: \(details.perimeter)")
```

### Expected Output

```text
Area: 78.5
Perimeter: 31.4
```

The generated shape is a `Circle` with a radius of `5`.

## 🧠 Concepts Demonstrated

* Swift Protocols
* Protocol-Oriented Programming
* Opaque Types (`some`)
* Existential Types (`any`)
* Abstraction
* Type Safety
* Classes and Initialization
* Tuples
* Method Implementation
* Basic Geometry Calculations

## 🛠️ Technologies

* **Swift**
* **Xcode**
* **Foundation**

## 📂 Project Structure

```text
swift-opaque-and-boxed-protocol-types/
└── main.swift
```

## 🎯 Learning Objective

The purpose of this exercise is to understand how Swift handles protocol-based abstraction and the difference between **opaque types** and **existential types**, while applying these concepts to a practical example using geometric shapes.

## 👨‍💻 Author

**Erik Valencia Cardona**

Computer Engineering Student
Interested in **iOS Development, Swift, Full Stack Development, and Software Engineering**.
