# ATM Machine Project 
# Name: Anushka Pachpute
# Roll No:20971

# initial setup
balance <- 10000   
correct_pin <- "2716"
withdraw_count <- 0
max_withdrawals <- 3
daily_limit <- 15000
total_withdrawn <- 0

# transaction history using c() as taught in class
history <- c()

cat("--- Welcome to ATM ---\n")

# PIN verification - 3 attempts using while loop
attempts <- 1  # counts number of attempts made
pin_ok <- FALSE

while(attempts <= 3)
{
  pin <- readline("Enter PIN: ")  # take PIN input from user
  
  if(pin == correct_pin)
  {
    pin_ok <- TRUE    # mark PIN as correct
    cat("PIN correct!\n")
    break        # exit loop if PIN is correct
  } else
  {
    cat("Wrong PIN.", 3 - attempts, "attempts left\n")
    attempts <- attempts + 1      # increase attempt count    
  }
}

# check if pin was correct or not
if(pin_ok == FALSE)
{
  cat("Card blocked. Too many wrong attempts.\n")
  
} else
{
  # main ATM loop
  i <- 1      # loop control variable
  while(i == 1)   # runs continuously until user exits
  {
  
     # Display ATM menu
    cat("\n====== MENU ======\n")
    cat("1. Check Balance\n")
    cat("2. Deposit\n")
    cat("3. Withdraw\n")
    cat("4. Transaction History\n")
    cat("5. Exit\n")
    cat("==================\n")
    
    ch <- readline("Enter your choice: ")   # take user choice
    if(ch == "1")
    {
      cat("Your current balance is:", balance, "\n")
      
    } else if(ch == "2")
    {
      amt <- readline("Enter deposit amount: ")
      amt <- as.numeric(amt) # convert input to numeric
      
      if(amt > 0)
      {
        balance <- balance + amt # add amount to balance
        cat("Amount deposited successfully\n")
        cat("Updated Balance:", balance, "\n")
        # store transaction in history using c() and paste() as taught in class
        history <- c(history, paste("Deposited:", amt))
      } else
      {
        cat("Amount should be greater than 0\n")
      }
      
    } else if(ch == "3")
    {
      # check withdrawal count limit first
      if(withdraw_count >= max_withdrawals)
      {
        cat("Sorry, maximum withdrawal limit reached for today\n")
        
      } else
      {
        amt <- readline("Enter withdrawal amount: ")
        amt <- as.numeric(amt)
        
        if(amt <= 0)
        {
          cat("Amount should be greater than 0\n")
        } else if(amt > balance)
        {
          cat("Insufficient Balance\n")
        } else if((total_withdrawn + amt) > daily_limit)
        {
          cat("Daily limit exceeded. Your daily limit is", daily_limit, "\n")
        } else
        {
          balance <- balance - amt  # deduct amount
          withdraw_count <- withdraw_count + 1    # increase withdrawal count
          total_withdrawn <- total_withdrawn + amt # update daily withdrawal total
          cat("Withdrawal successful!\n")
          cat("Amount withdrawn:", amt, "\n")
          cat("Balance left:", balance, "\n")
          cat("Withdrawals used:", withdraw_count, "out of", max_withdrawals, "\n")
          # store in history
          history <- c(history, paste("Withdrawn:", amt))
        }
      }
      
    } else if(ch == "4")
    {
      # print transaction history using for loop as taught in class
      if(length(history) == 0)
      {
        cat("No transactions yet\n")
      } else
      {
        cat("--- Transaction History ---\n")
        for(x in history)
        {
          print(x)
        }
      }
      
    } else if(ch == "5")
    {
      cat("\nThank you for using ATM. Goodbye!\n")
      break
      
    } else
    {
      cat("Invalid choice. Please enter 1 to 5\n")
    }
    
  }
}