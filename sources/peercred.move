module P2PLending::P2PLending {
    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    /// Struct representing a loan with dynamic interest rate
    struct Loan has store, key {
        borrower: address,
        amount: u64,
        interest_rate: u64,  // Interest rate in basis points (e.g., 500 = 5%)
        credit_score: u64,   // Simple credit score based on wallet history
        is_active: bool,
    }

    /// Struct to track user's credit score
    struct CreditProfile has store, key {
        total_borrowed: u64,
        total_repaid: u64,
        loan_count: u64,
    }

    /// Function to create a loan with dynamic interest rate based on credit score
    public fun create_loan(borrower: &signer, lender: address, amount: u64) acquires CreditProfile {
        let borrower_addr = signer::address_of(borrower);
        
        // Calculate credit score and interest rate
        let credit_score = if (exists<CreditProfile>(borrower_addr)) {
            let profile = borrow_global<CreditProfile>(borrower_addr);
            if (profile.total_borrowed > 0) {
                (profile.total_repaid * 100) / profile.total_borrowed
            } else { 50 }
        } else { 50 };

        // Dynamic interest: higher credit score = lower interest
        let interest_rate = if (credit_score >= 80) { 300 }
                           else if (credit_score >= 50) { 500 }
                           else { 800 };

        let loan = Loan {
            borrower: borrower_addr,
            amount,
            interest_rate,
            credit_score,
            is_active: true,
        };

        move_to(borrower, loan);
    }

    /// Function to repay loan and update credit profile
    public fun repay_loan(borrower: &signer, lender: address, repay_amount: u64) acquires Loan, CreditProfile {
        let borrower_addr = signer::address_of(borrower);
        let loan = borrow_global_mut<Loan>(borrower_addr);

        // Transfer repayment to lender
        let payment = coin::withdraw<AptosCoin>(borrower, repay_amount);
        coin::deposit<AptosCoin>(lender, payment);

        // Update credit profile
        if (!exists<CreditProfile>(borrower_addr)) {
            move_to(borrower, CreditProfile {
                total_borrowed: loan.amount,
                total_repaid: repay_amount,
                loan_count: 1,
            });
        } else {
            let profile = borrow_global_mut<CreditProfile>(borrower_addr);
            profile.total_repaid = profile.total_repaid + repay_amount;
        };

        loan.is_active = false;
    }
}