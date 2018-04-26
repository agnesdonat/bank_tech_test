# Bank Tech Test

### Requirements
* You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

* Given a client makes a deposit of 1000 on 10-01-2012
* And a deposit of 2000 on 13-01-2012
* And a withdrawal of 500 on 14-01-2012
* When she prints her bank statement
* Then she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00

```

## Approach to Design ##

Based on the requirements, outlined above I decided to implement an Object Oriented solution in a Test Driven Development manner using Ruby and RSpec. First, I created the user stories (please see below) that were leading my domain modelling process. I planned to create two Classes: one that stores changes after transactions (Account) and one that prints the transaction history to the console (StatementPrinter). After covering the main functionality of saving deposit and withdrawal history, I was experimenting on a separate branch extracting responsibilities into smaller classes. However, when I started writing tests for the new classes I realised that I was testing for the same behaviour I had already covered.

Given more time, I would have created an Amount class that would check if the Client has entered a valid amount, i.e. they are using digits and they are not entering negative numbers.

At the moment, I believe that my solution meets the specifications, test coverage is 98% and code has been refactored to eliminate offenses detected by rubocop.


## User Stories ##

```
As a Client
So I can add credit to my bank account
I want to make a deposit

As a Client
So I can see when I made a deposit
I want to see the date against making a deposit

As a Client
So I can see how much money I have in my bank account
I want to see my balance

As a Client
So I can withdraw money from my bank account
I want to make a withdrawal

As a Client
So I do not go into my overdraft
I cannot withdraw more money than I have in my bank account

As a Client
So I can see when I made a withdrawal
I want to see the date of the withdrawal

As a Client,
So I can check my balance
I want to see my bank statement

```
## How to install and run code ##
* Clone Repository
* Open Command Line
* cd to Directory
* run bundle
* run rspec to see Test Coverage
* run IRB
* require './lib/account.rb'
* require './lib/statement_printer.rb'
* Create a new account: account = Account.new
* To add a deposit - account.make_a_deposit(amount)
* To add a withdrawal - account.make_a_withdrawal(amount)
* Create a printer passing the account as an argument: printer = StatementPrinter.new(account)
* To print statement - printer.print_statement

## Screenshot ##

![Alt text](/screenshot/ScreenShot2018-04-26at16.37.37.png)
