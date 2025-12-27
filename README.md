# Peer-to-Peer Lending with Dynamic Interest Rates

## Project Description

A decentralized peer-to-peer lending platform built on the Aptos blockchain that implements dynamic interest rates based on on-chain credit scoring. The smart contract evaluates borrowers' wallet history to calculate personalized credit scores, which directly influence the interest rates offered on loans. This creates a fair and transparent lending ecosystem where responsible borrowers are rewarded with lower interest rates, while lenders are protected through risk-based pricing.

## Project Vision

Our vision is to democratize access to financial services by creating a trustless, transparent, and efficient peer-to-peer lending platform. By leveraging blockchain technology and on-chain credit scoring, we aim to:

- **Eliminate Traditional Barriers**: Remove intermediaries and reduce costs associated with traditional lending
- **Promote Financial Inclusion**: Provide access to credit for underserved populations based on verifiable on-chain behavior
- **Reward Responsible Borrowing**: Incentivize good financial behavior through dynamic interest rates
- **Build Trust Through Transparency**: Ensure all lending terms and credit assessments are visible and immutable on-chain

## Key Features

### 1. **Dynamic Interest Rate Calculation**
Interest rates are automatically adjusted based on the borrower's credit score, ensuring fair pricing:
- High credit score (≥80%): 3% interest rate
- Medium credit score (50-79%): 5% interest rate
- Low credit score (<50%): 8% interest rate

### 2. **On-Chain Credit Scoring**
Credit scores are calculated transparently using verifiable wallet history:
- Total amount borrowed
- Total amount repaid
- Number of loans completed
- Repayment ratio (repaid/borrowed)

### 3. **Automated Loan Management**
Two core functions handle the entire lending lifecycle:
- `create_loan`: Initiates a loan with automatically calculated interest based on credit score
- `repay_loan`: Processes repayments and updates the borrower's credit profile

### 4. **Credit Profile Building**
Borrowers build their reputation over time through successful loan repayments, unlocking better terms for future loans.

### 5. **Transparent and Trustless**
All loan terms, credit scores, and transaction history are stored immutably on the blockchain, ensuring complete transparency.

## Future Scope

### Short-term Enhancements
- **Collateral Support**: Implement overcollateralized loans for risk mitigation
- **Partial Repayments**: Allow borrowers to repay loans in installments
- **Loan Duration**: Add time-based loan terms with maturity dates
- **Late Payment Penalties**: Implement penalty mechanisms for overdue payments

### Medium-term Goals
- **Multi-Asset Support**: Enable lending and borrowing with various cryptocurrencies
- **Liquidation Mechanism**: Automatic collateral liquidation for defaulted loans
- **Credit Score Algorithm Enhancement**: Incorporate additional factors like transaction frequency, wallet age, and DeFi activity
- **Interest Accrual**: Real-time interest calculation and compounding

### Long-term Vision
- **Cross-Chain Lending**: Bridge functionality to enable lending across multiple blockchains
- **DAO Governance**: Community-driven protocol parameters and risk management
- **Credit Score NFTs**: Portable credit reputation as non-transferable NFTs
- **Integration with DeFi Protocols**: Connect with yield aggregators and liquidity pools
- **Insurance Pools**: Lender protection through decentralized insurance mechanisms
- **Advanced Risk Models**: Machine learning-based credit assessment using comprehensive on-chain data

## Contract Details

- **Sender Address**: `0x31eec05ed22edc4771c9cb99e2ba6bd83594531554463256724cd86336ecd2db`
- **Explorer Link**: [View on Aptos Explorer](https://explorer.aptoslabs.com/txn/0x5e098f04a669153de263c727cfdbaef5e43eb4724c43427c6807e9cfbac11b25?network=devnet)
