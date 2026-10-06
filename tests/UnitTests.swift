import XCTest
@testable import ChallengeApp

final class UnitTests: XCTestCase {

    private var service: TransferService!
    private var analyzer: StatementAnalyzer!

    override func setUpWithError() throws {
        service = TransferService()
        analyzer = StatementAnalyzer()
    }

    override func tearDownWithError() throws {
        service = nil
        analyzer = nil
    }

    func test_validate_lanzaInvalidAmount_conCero() {
        XCTAssertThrowsError(try service.validate(amount: 0)) { error in
            XCTAssertEqual(error as? WalletError, .invalidAmount)
        }
    }

    func test_validate_lanzaInvalidAmount_conNegativo() {
        XCTAssertThrowsError(try service.validate(amount: -1)) { error in
            XCTAssertEqual(error as? WalletError, .invalidAmount)
        }
    }

    func test_validate_aceptaMontoPositivo() {
        XCTAssertNoThrow(try service.validate(amount: 1))
    }

    func test_transfer_actualizaSaldosEnCaminoFeliz() throws {
        let source = Account(id: "1", owner: "Ada", balance: 100)
        let destination = Account(id: "2", owner: "Bruno", balance: 10)

        let result = try service.transfer(amount: 40, from: source, to: destination)

        XCTAssertEqual(result.source.balance, 60)
        XCTAssertEqual(result.destination.balance, 50)
    }

    func test_transfer_lanzaInsufficientFunds() {
        let source = Account(id: "1", owner: "Ada", balance: 20)
        let destination = Account(id: "2", owner: "Bruno", balance: 0)

        XCTAssertThrowsError(try service.transfer(amount: 50, from: source, to: destination)) { error in
            XCTAssertEqual(error as? WalletError, .insufficientFunds)
        }
    }

    func test_transfer_lanzaInvalidAmount_conMontoCero() {
        let source = Account(id: "1", owner: "Ada", balance: 100)
        let destination = Account(id: "2", owner: "Bruno", balance: 0)

        XCTAssertThrowsError(try service.transfer(amount: 0, from: source, to: destination)) { error in
            XCTAssertEqual(error as? WalletError, .invalidAmount)
        }
    }

    func test_total_sumaSoloElTipoIndicado() {
        let transactions = [
            Transaction(id: "a", type: .deposit, amount: 100, date: Date()),
            Transaction(id: "b", type: .withdrawal, amount: 30, date: Date()),
            Transaction(id: "c", type: .deposit, amount: 50, date: Date())
        ]

        XCTAssertEqual(analyzer.total(of: .deposit, in: transactions), 150)
        XCTAssertEqual(analyzer.total(of: .withdrawal, in: transactions), 30)
    }

    func test_total_devuelveCeroCuandoNoHayCoincidencias() {
        let transactions = [
            Transaction(id: "a", type: .deposit, amount: 100, date: Date())
        ]

        XCTAssertEqual(analyzer.total(of: .transfer, in: transactions), 0)
    }

    func test_duplicateTransactionIDs_detectaDuplicados() {
        let transactions = [
            Transaction(id: "a", type: .deposit, amount: 100, date: Date()),
            Transaction(id: "b", type: .deposit, amount: 100, date: Date()),
            Transaction(id: "c", type: .withdrawal, amount: 50, date: Date())
        ]

        let duplicates = analyzer.duplicateTransactionIDs(in: transactions)

        XCTAssertEqual(Set(duplicates), ["a", "b"])
    }

    func test_duplicateTransactionIDs_sinDuplicados() {
        let transactions = [
            Transaction(id: "a", type: .deposit, amount: 100, date: Date()),
            Transaction(id: "b", type: .withdrawal, amount: 50, date: Date())
        ]

        XCTAssertTrue(analyzer.duplicateTransactionIDs(in: transactions).isEmpty)
    }

    func test_buildSummary_contieneUnaLineaPorTransaccion() {
        let transactions = [
            Transaction(id: "a", type: .deposit, amount: 100, date: Date()),
            Transaction(id: "b", type: .withdrawal, amount: 50, date: Date())
        ]

        let summary = analyzer.buildSummary(for: transactions)
        let lines = summary.split(separator: "\n")

        XCTAssertEqual(lines.count, 2)
        XCTAssertTrue(summary.contains("[deposit] 100"))
        XCTAssertTrue(summary.contains("[withdrawal] 50"))
    }
}
