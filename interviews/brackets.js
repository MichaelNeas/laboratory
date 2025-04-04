// calculateTax(salary, brackets) {}
// Bracket [{start, end, }]

const { access } = require("fs");

function calculateTax(salary, brackets) {
  let bracketsOrdered = brackets.sort((a, b) => a.start < b.start);
  var mutableSalary = salary;
  var taxesOwed = 0;
  var bracketIndex = 0;

  while (mutableSalary > 0) {
    var taxableAmount = 0;
    if (bracketsOrdered.length - 1 == bracketIndex) {
      taxableAmount = mutableSalary;
    } else {
      taxableAmount =
        bracketsOrdered[bracketIndex].end - bracketsOrdered[bracketIndex].start;
    }
    mutableSalary -= taxableAmount;
    taxesOwed += taxableAmount * (bracketsOrdered[bracketIndex].rate / 100);
    bracketIndex += 1;
  }
  return taxesOwed;
}

// invert problem, iterate through each
function calculateTaxV2(salary, brackets) {
  return brackets
    .sort((a, b) => a.start < b.start)
    .reduce((acc, curr) => {
      let taxableIncome = 0;
      if (curr.end == Number.MAX_VALUE) {
        taxableIncome = Math.max(0, salary - curr.start);
      } else {
        taxableIncome = Math.min(
          Math.max(0, salary - curr.start),
          curr.end - curr.start,
        );
      }
      return acc + taxableIncome * (curr.rate / 100);
    }, 0);
}

const brackets = [
  { start: 0, end: 10000, rate: 5 }, // 500
  { start: 10000, end: 30000, rate: 10 }, // 2000
  { start: 30000, end: 60000, rate: 15 },
  { start: 60000, end: 100000, rate: 20 },
  { start: 100000, end: 150000, rate: 25 },
  { start: 150000, end: 250000, rate: 30 },
  { start: 250000, end: Number.MAX_VALUE, rate: 40 },
];

for (const salary of [
  0, 5000, 10000, 20000, 30000, 40000, 80000, 100000, 160000, 250000, 500000,
])
  console.log(
    `income tax for salary $${salary} is $${calculateTaxV2(salary, brackets)}`,
  );
