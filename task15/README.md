# Project Euler 🧮

In solving various problems under Project Euler, I discovered that to pass all the test cases, solutions should avoid excessive loops and instead employ direct mathematical approaches. Below are my approaches to the first three problems I've solved.

## Problem 1: 🧮

The problem statement for this question was to find the sum of multiples of 3 and 5. To achieve this, I applied a basic arithmetic progression (AP) trick. It involves the sum of multiples of 3 plus the sum of multiples of 5 minus the sum of multiples of 15. This results in the sum of multiples of 3 and 5. To find the sum of multiples, I utilized the general sum of natural numbers formula for AP.

## Problem 2: 🧮

The second problem revolves around finding the sum of even Fibonacci numbers. My approach began with generating Fibonacci numbers and adding them to a list. Before adding a number, I checked if it was even using an if condition. If the number was even, I added it to the sum, which was initially set to 2 since the Fibonacci list started with 1 and 2. The loop stopped before reaching the maximum specified by the user.

## Problem 3: 🧮

The primary objective in solving this problem was to identify the factors of a number, check if they are prime, append them to a list, and then find the maximum element in the list. To accomplish this, I first generated prime numbers up to 'n'. Then, I checked if they were divisible by 'n'. If they were divisible, I added them to a list and used the 'max' function to find the maximum element in the list.

