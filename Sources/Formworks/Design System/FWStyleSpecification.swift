//
//  FWStyleSpecification.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 29/10/20.
//

import UIKit

/// The custom color style specification.
public struct FWStyleSpecification: Codable {
    /// Used to highlight buttons and interactable elements.
    var accent: UIColor = .fwAccent
    /// Form view background color.
    var background: UIColor = .fwBackground
    /// Component view background color.
    var componentBackground: UIColor = .fwComponentBackground
    /// Component title text color.
    var componentTitle: UIColor = .fwComponentTitle
    /// Component description text color.
    var componentDescription: UIColor = .fwComponentDescription
    /// Component input field text color.
    var componentInputText: UIColor = .fwComponentInputText
    /// Component input background color.
    var componentInputBackground: UIColor = .fwComponentInputBackground
    /// Component required checkmark color.
    var componentRequired: UIColor = .fwComponentRequired
    /// Component valid input checkmark color.
    var componentCorrect: UIColor = .fwComponentCorrect
    /// Component placeholder text color.
    var componentPlaceholder: UIColor = .fwComponentPlaceholder
    
    /// Creates a new  instance with default values
    public init() {
        self.accent = .fwAccent
        self.background = .fwBackground
        self.componentBackground = .fwComponentBackground
        self.componentTitle = .fwComponentTitle
        self.componentDescription = .fwComponentDescription
        self.componentInputText = .fwComponentInputText
        self.componentInputBackground = .fwComponentInputBackground
        self.componentRequired = .fwComponentRequired
        self.componentCorrect = .fwComponentCorrect
        self.componentPlaceholder = .fwComponentPlaceholder
    }
    
    /// Creates a new instance with given values
    init(accent: UIColor,
                background: UIColor,
                componentBackground: UIColor,
                componentTitle: UIColor,
                componentDescription: UIColor,
                componentInputText: UIColor,
                componentInputBackground: UIColor,
                componentRequired: UIColor,
                componentCorrect: UIColor,
                componentPlaceholder: UIColor) {
        self.accent = accent
        self.background = background
        self.componentBackground = componentBackground
        self.componentTitle = componentTitle
        self.componentDescription = componentDescription
        self.componentInputText = componentInputText
        self.componentInputBackground = componentInputBackground
        self.componentRequired = componentRequired
        self.componentCorrect = componentCorrect
        self.componentPlaceholder = componentPlaceholder
    }
}

fileprivate struct FWStyleSpecificationDTO: Codable {
    let accent: String?
    let background: String?
    let componentBackground: String?
    let componentTitle: String?
    let componentDescription: String?
    let componentInputText: String?
    let componentInputBackground: String?
    let componentRequired: String?
    let componentCorrect: String?
    let componentPlaceholder: String?
}

extension FWStyleSpecification: Equatable {
    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let dto = try FWStyleSpecificationDTO.init(from: decoder)
        self.accent = UIColor(hex: dto.accent ?? "") ?? .fwAccent
        self.background = UIColor(hex: dto.background ?? "") ?? .fwBackground
        self.componentBackground = UIColor(hex: dto.componentBackground ?? "") ?? .fwComponentBackground
        self.componentTitle = UIColor(hex: dto.componentTitle ?? "") ?? .fwComponentTitle
        self.componentDescription = UIColor(hex: dto.componentDescription ?? "") ?? .fwComponentDescription
        self.componentInputText = UIColor(hex: dto.componentInputText ?? "") ?? .fwComponentInputText
        self.componentInputBackground = UIColor(hex: dto.componentInputBackground ?? "") ?? .fwComponentInputBackground
        self.componentRequired = UIColor(hex: dto.componentRequired ?? "") ?? .fwComponentRequired
        self.componentCorrect = UIColor(hex: dto.componentCorrect ?? "") ?? .fwComponentCorrect
        self.componentPlaceholder = UIColor(hex: dto.componentPlaceholder ?? "") ?? .fwComponentPlaceholder
    }

    /// Encodes this value into the given encoder.
    ///
    /// If the value fails to encode anything, `encoder` will encode an empty
    /// keyed container in its place.
    ///
    /// This function throws an error if any values are invalid for the given
    /// encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        let dto = FWStyleSpecificationDTO(
            accent: self.accent.toHex(true),
            background: self.background.toHex(true),
            componentBackground: self.componentBackground.toHex(true),
            componentTitle: self.componentTitle.toHex(true),
            componentDescription: self.componentDescription.toHex(true),
            componentInputText: self.componentInputText.toHex(true),
            componentInputBackground: self.componentInputBackground.toHex(true),
            componentRequired: self.componentRequired.toHex(true),
            componentCorrect: self.componentCorrect.toHex(true),
            componentPlaceholder: self.componentPlaceholder.toHex(true)
        )
        try dto.encode(to: encoder)
    }
    
    public static func ==(lhs: FWStyleSpecification, rhs: FWStyleSpecification) -> Bool {
        return lhs.accent == rhs.accent &&
            lhs.background == rhs.background &&
            lhs.componentBackground == rhs.componentBackground &&
            lhs.componentTitle == rhs.componentTitle &&
            lhs.componentDescription == rhs.componentDescription &&
            lhs.componentInputText == rhs.componentInputText &&
            lhs.componentInputBackground == rhs.componentInputBackground &&
            lhs.componentRequired == rhs.componentRequired &&
            lhs.componentCorrect == rhs.componentCorrect &&
            lhs.componentPlaceholder == rhs.componentPlaceholder
    }
}
