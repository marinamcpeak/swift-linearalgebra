//
//  MatricesError.swift
//  
//
//  Created by Marina McPeak on 2022-07-07.
//

import Foundation

enum MatricesError: Error {
    case invalidMatrixSize(minimumSize: Int)
    case invalidMatrixShape
}

extension MatricesError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .invalidMatrixSize(minimumSize: _):
            return "The defined matrix size must have positive parameters."
        case .invalidMatrixShape:
            return "The matrix selected must be a square matrix."
        }
    }
}
