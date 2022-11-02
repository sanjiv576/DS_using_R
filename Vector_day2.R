age = c(40L, 34L, 33L, 29L, 7L)
print(age)

people = c("Ramesh","Rajesh", "CHris", "ROhan")
print(people)

typeof(age)
typeof(people)

# seq(start, stop, step)
odds = seq(1, 20, 1)
print(odds)

evens = seq(2, 20, 2)
print(evens)

# print sequence numbers
seq_num = 1:100
print(seq_num)


# Vector addition , c -> combine , c denotes vector
a = c(1L, 3L, 4L, 5L)
b = c(3L, 4L, 1L, 5L)
print(a+b)


print(a%%b)
# note: default value of vector is character
c = c('d', 66, 'e', 12)
typeof(c)

# note: default value of numbers in vector is double
d = c(23, 12, 3)
typeof(d)



# customising index in vector

vowels = c('a', 'e', 'i', 'o', 'u')

print(vowels[1])
# length
print(length(vowels))

# indexing
print(vowels[length(vowels)])

# from index 2 to 4
print(vowels[2:4])

# from index 1, 3, 5
print(vowels[c(1,3,5)])

print(vowels[11])

# no negative index in R
#remove
print(vowels[-3])


# Logical operations

shoe_sizes = c(5.5, 11, 7, 8, 4)
filter = c(TRUE, FALSE, FALSE, FALSE, TRUE)

# shows only true
print(shoe_sizes[filter])

shoes_is_small = shoe_sizes > 6
print(shoes_is_small)
print(shoe_sizes[shoes_is_small])
print(shoe_sizes[shoe_sizes>6])


# Lists in vector

list_1 = list(1, 2, 3, 4)
print(list_1)

list_2 = list("Arsenal", "Azax", "leeds United", "Reading")
print(list_2)

list_3 = list(1, "Arsenal", "Vikings", 33)
print(list_3)

nested_list = list(list_1, list_2, list_3)
print(nested_list)



person = list(
  first_name = "Ada",
  job = "Programmer",
  salary = 100000,
  carparking_permit = TRUE
)
print(person)

# show columns' values
names(person)

# $ --> variable or column
person$first_name
person$job

# [[...]]  --> this is double, also known as recursive
person[["salary"]]

# [...] --> this is list
person["salary"]

x = person[["salary"]]
y = person["salary"]
typeof(x)
typeof(y)

animals = list("Aardvark","Baboon","Camel")
print(animals)

# this is list
animals[1]
typeof(animals[1])

# this is character
animals[[1]]
typeof(animals[[1]])

is.list(animals)
is.list(animals[1])
is.list(animals[[1]])

########################## Exercise ########################## 

# Create your own vector, e.g., names of some of your friends.
friends_name = c("Sudip", "Ramesh", "Parash", "Prashant")

# Create your own list, e.g., some details of your life.
my_details = list(
  first_name = "Sanjiv",
  last_name = "Shrestha",
  age = 123,
  studying = TRUE
)


# Create a list which has another list as one of its elements. --> nested list
hobbies = list("Travel", "Swim", "Watch movies")
all_details = list(my_details, hobbies)

print(all_details)

# Create a list which has a vector as one of its elements.
my_friends = list(friends_name)
print(my_friends)

# Is it possible (in R) to create a vector which has a list as one its elements? --> Ans: Yes
vc = c(all_details)
print(vc)



