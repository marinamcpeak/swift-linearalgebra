//
//  MatrixOperations.swift
//  
//
//  Created by Marina McPeak on 2022-07-07.
//

import Foundation
import Numerics

class MatrixOperations {
    
    // Add two matrices
    public static func addition(A: Matrices, B: Matrices) throws -> Matrices {
        var newMatrix = try Matrices(row: A.row, column: A.column)
        if (A.row == B.row && A.column == B.column) {
            for i in 0..<newMatrix.row {
                for j in 0..<newMatrix.column {
                    newMatrix.matrix[i][j] = A.matrix[i][j] + B.matrix[i][j]
                }
            }
        }
        return newMatrix
    }
    
    // Subtract two matrices
    public static func subtraction(A: Matrices, B: Matrices) throws -> Matrices {
        var newMatrix = try Matrices(row: A.row, column: A.column)
        if (A.row == B.row && A.column == B.column) {
            for i in 0..<newMatrix.row {
                for j in 0..<newMatrix.column {
                    newMatrix.matrix[i][j] = A.matrix[i][j] - B.matrix[i][j]
                }
            }
        }
        return newMatrix
    }

}
