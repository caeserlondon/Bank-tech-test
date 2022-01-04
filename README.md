# Bank tech test

### Requirements

* we should be able to interact with our code via a REPL like IRB.
* (we don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```text
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```


### Approach

##### Creating User stories

```
As a user
So that I have a place to store money
I want to be able to open a new bank account
```

```
As a user
So I can store my money into my account
I want to be able to make a deposit
```

```
As a user
So I can access my stored money
I want to be able to make a withdrawal
```

```
As a user
So I can see a history of my transactions
I want to be able to see my account statement
```