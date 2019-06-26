//
//  MedStickerEncryptionV2Tests.swift
//  Krypt_Tests
//
//  Created by Sun Bin Kim on 21.06.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Krypt
import XCTest

final class MedStickerEncryptionV2Tests: XCTestCase {
  func testGenerateFingerprintSecret__shouldGenerate256BitsData() {
    let expectedLength = 32 // 32bytes = 256bits

    let fakePinData = "fakePin".data(using: .utf8)!
    let subject = try! MedStickerEncryptionV2.generateFingerprintSecret(pin: fakePinData)

    XCTAssertEqual(subject.count, expectedLength)
  }

  func testGenerateKeyAndFingerprintFile__shouldGenerate256BitsKeyAnd256BitsFingerprintFilePair() {
    let expectedKeyLength = 32 // 32bytes = 256bits
    let expectedFingerprintFileLength = 32 // 32bytes = 256bits

    let fakePinData = "fakePin".data(using: .utf8)!
    let fakeBackendSecret = "fakeBackendSecret".data(using: .utf8)!
    let fakeSecondSalt = "fakeSecondSalt".data(using: .utf8)!

    let subject = try! MedStickerEncryptionV2.generateKeyAndFingerprintFile(pin: fakePinData, secret: fakeBackendSecret, salt: fakeSecondSalt)

    XCTAssertEqual(subject.key.count, expectedKeyLength)
    XCTAssertEqual(subject.fingerprintFile.count, expectedFingerprintFileLength)
  }
}
