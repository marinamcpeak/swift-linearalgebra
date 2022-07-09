//
//  Matrices.swift
//  
//
//  Created by Marina McPeak on 2022-07-07.
//

import Foundation

public struct Matrices: CustomStringConvertible {
    
    var row: Int
    var column: Int
    var matrix = [[Int]]()
    
    // Create non-square (mxn) matrix
    // See if a null value can be changed in the constructor
    public init(row: Int, column: Int) throws {
        guard row >= 0 && column >= 0 else {
            throw MatricesError.invalidMatrixSize(minimumSize: 1)
        }
        self.row = row
        self.column = column
        createZeroMatrix()
    }
    
    // Create square (nxn) matrix
    // Square is a bit ambigious (e.g. dimensions)
    public init(square: Int) throws {
        guard square >= 0 else {
            throw MatricesError.invalidMatrixSize(minimumSize: 1)
        }
        self.row = square
        self.column = square
        createZeroMatrix()
    }
    
    private mutating func createZeroMatrix() {
        matrix = Array(repeating: Array(repeating: 0, count: column), count: row)
    }
    
    private mutating func allEntries(value: Int) {
        for i in 0..<row {
            for j in 0..<column {
                matrix[i][j] = value
            }
        }
    }
    
    private func matrixShapeGuard() throws {
        guard row == column else {
                throw MatricesError.invalidMatrixShape
            }
    }
    
    // Zero Matrix: All entries are zero
    public mutating func allZeros() {
        allEntries(value: 0)
    }
    
    // Matrix of Ones: All entries are one
    public mutating func allOnes() {
        allEntries(value: 1)
    }
    
    // Random entries within defined bounds
    public mutating func random(min: Int, max: Int) {
        for i in 0..<row {
            for j in 0..<column {
                matrix[i][j] = Int.random(in: min...max)
            }
        }
    }
    
    // Identity Matrix (nxn): Ones on the main diagonal and zeroes everywhere else
    // Call the diagonal matrix and expand functionality
    public mutating func identity() throws {
        try matrixShapeGuard()
        var j = 0
        for i in 0..<row {
            matrix[i][j] = 1
            j += 1
        }
    }
    
    // Random Arrowhead Matrix (nxn): Contains all zeroes except on the first row, first column, and main diagonal
    public mutating func randomArrowhead(min: Int, max: Int) throws {
        try matrixShapeGuard()
        let k = 0
        var l = 1
        
        for i in 0..<row {
            if (i == 0) {
                for j in 0..<column {
                    matrix[i][j] = Int.random(in: min...max)
                }
            }
            else {
                matrix[i][k] = Int.random(in: min...max)
                matrix[i][l] = Int.random(in: min...max)
                l += 1
            }
        }
    }
    
    // Random Diagonal Matrix (mxn): Random entities on main diagonal
    public mutating func randomDiagonal(min: Int, max: Int) {
        for i in 0..<row {
            for j in 0..<column {
                if (i == j) {
                    matrix[i][j] = Int.random(in: min...max)
                }
            }
        }
    }
    
    // Random Bidiagonal Matrix (mxn): Random entities on main diagonal and either the diagonal above or below
    public mutating func randomBidiagonal(upper: Bool, min: Int, max: Int) {
        // Replace one with a variable
        if (upper) {
            for i in 0..<row {
                for j in 0..<column {
                    if (i == j || i == (j - 1)) {
                        matrix[i][j] = Int.random(in: min...max)
                    }
                }
            }
        }
        else {
            for i in 0..<row {
                for j in 0..<column {
                    if (i == j || i == (j + 1)) {
                        matrix[i][j] = Int.random(in: min...max)
                    }
                }
            }
        }
    }
    
    // Print matrices object
    public var description: String {
        var matrixString = ""
        for i in 0..<row {
            for j in 0..<column {
                if (matrix[i][j] < 10) {
                    matrixString += "\(matrix[i][j])   "
                }
                else if (matrix[i][j] < 100) {
                    matrixString += "\(matrix[i][j])  "
                }
                else {
                    matrixString += "\(matrix[i][j]) "
                }
            }
            matrixString += "\n"
        }
        return matrixString
    }
}
