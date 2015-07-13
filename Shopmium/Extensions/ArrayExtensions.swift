//
//  ArrayExtensions.swift
//  innerly
//
//  Created by Gomino on 06/09/2014.
//  Copyright (c) 2014 labgency. All rights reserved.
//

import Foundation

extension Array {
    func find(includedElement: T -> Bool) -> Int? {
        for (idx, element) in enumerate(self) {
            if includedElement(element) {
                return idx
            }
        }
        return nil
    }
}