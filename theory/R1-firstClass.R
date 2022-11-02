num = as.integer(readline(prompt = "Enter a number : "))
if(num < 0){
  print("Enter a number again ")
  
}
else {
  sum = 0
  while(num > 0){
    sum = sum + num
    num = num -1
  }
  print(paste("The sum is ", sum))
}



lastNum = as.integer(readline(prompt = "Enter a positive number : "))
if(lastNum < 0){
  print("Enter a number again : ")
}
else {
  sum = 0
  while(lastNum > 0){
    sum = lastNum^3 + sum
    lastNum = lastNum - 1
  }
  print(paste("Result ", sum))
}