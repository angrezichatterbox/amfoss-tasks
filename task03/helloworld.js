const readline = require('readline');
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question('', n => {
  n = parseInt(n);
  for (let i = 2; i < n; i++) {
    let prime = true;
    for (let b = 2; b < i; b++) {
      if (i % b === 0) {
        prime = false;
        break;
      }
    }
    if (prime) {
      console.log(i);
    }
  }
  rl.close();
});
