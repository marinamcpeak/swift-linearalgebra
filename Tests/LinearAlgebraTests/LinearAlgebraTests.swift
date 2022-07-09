import XCTest
@testable import LinearAlgebra

final class LinearAlgebraTests: XCTestCase {
    func testZeroMatrix() throws {
        let firstMatrix = try Matrices(row: 5, column: 7)
        let secondMatrix = try Matrices(row: 5, column: 7)
        XCTAssertTrue(firstMatrix.matrix == secondMatrix.matrix)
    }
    
    func testDescription() throws {
        var newMatrix = try Matrices(row: 10, column: 12)
        newMatrix.randomBidiagonal(upper: true, min: 1, max: 10)
        print(newMatrix.description)
    }
    
    // Hardcode matrices
}
