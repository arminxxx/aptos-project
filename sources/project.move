module MyModule::MicroLoanPlatform {

    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;
    use aptos_framework::signer;

    /// Struct to represent a loan
    struct Loan has key, store {
        amount: u64,      // Amount of the loan
        borrower: address,  // Address of the borrower
    }

    /// Function for users to request a loan
    public fun request_loan(borrower: &signer, amount: u64) {
        let loan = Loan {
            amount,
            borrower: signer::address_of(borrower),
        };
        move_to(borrower, loan);
    }

}
