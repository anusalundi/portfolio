print("Welcome to the bank!")

balance = 0

while True:
    print("\nWhat would you like to do?")
    print("1. Deposit money")
    print("2. Withdraw money")
    print("3. Check balance")
    print("4. Exit")

    try:
        choice = int(input("Enter your choice: "))
    except:
        print("Invalid input. Please enter 1, 2, 3 or 4.")
        continue

    if choice == 1:
        try:
            deposit = int(input("Enter the amount you want to deposit: "))
            balance = deposit + balance
            print(f"Current balance: {balance}")
        except:
            print("Invalid input. Please enter a number.")
    elif choice == 2:
        try:
            withdrawal = int(input("Enter the amount you want to withdraw: "))
            if withdrawal > balance:
                print("The account does not have enough money.")
            else:
                balance = balance - withdrawal
                print(f"Current balance: {balance}")
        except:
            print("Invalid input. Please enter a number.")
    elif choice == 3:
        print(f"Current balance: {balance}")
    elif choice == 4:
        break
    else:
        print("Invalid choice. Please enter 1, 2, 3 or 4.")

print("Thank you!")
