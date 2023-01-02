import { LightningElement,api,wire,track } from 'lwc';

export default class JsTesting extends LightningElement {

    handleClick(){
        ///////////////////////
        const numbers = [45, 4, 9, 16, 25];
let txt = "";
numbers.forEach(myFunction);
console.log('txt1'+txt);

function myFunction(value, index, array) {
  txt += value;
}
///////////////////////////////////
const numbers1 = [45, 4, 9, 16, 25];
const numbers2 = numbers1.map(myFunction1);

console.log('number2'+numbers2);

function myFunction1(value, index, array) {
  return value * 2;
}
////////////////////
const numbe = [45, 4, 9, 16, 25];
const over18 = numbe.filter(myFunction2);

console.log('Over18>>>>'+over18);

function myFunction2(value, index, array) {
  return value > 18;
}
/////////////////////
const numbers12 = [45, 4, 9, 16, 25];
let sum = numbers12.reduce(myFunction3);
console.log("The sum is " + sum);

function myFunction3(total, value, index, array) {
  return total + value;
}
//////////////////////////////
const numbers123 = [45, 4, 9, 16, 25];
let sum123 = numbers123.reduceRight(myFunction4);

console.log("The sum123 is " + sum123);

function myFunction4(total, value, index, array) {
  return total + value;
}
/////////////////////////////
const numbers456 = [45, 4, 9, 16, 25];
let allOver18 = numbers456.every(myFunction5);

console.log("All over 18 is " + allOver18);

function myFunction5(value, index, array) {
  return value > 18;
}
///////////////////////////
const fruits = ["Banana", "Orange", "Apple", "Mango"];
console.log('fruits.includes("Mango")'+fruits.includes("Mango"));
////////////////////////////////////

const keys = fruits.keys();

let text = "";
for (let x of keys) {
  text += x + "<br>";
}

console.log('fruits keys'+text);
//////////////////////////////////////
const myArr = Array.from("ABCDEFG");
console.log(myArr);
////////////////////////////////////////////
const numbersq = [4, 9, 16, 25, 29];
let first = numbersq.find(myFunctionq);

console.log("First number over 18 is " + first);

function myFunctionq(value, index, array) {
  return value > 18;
}
////////////////////////////////////////
let position = fruits.lastIndexOf("Apple") + 1;

console.log("Apple is found in position " + position);
/////////////////////////////////////////////
let position1 = fruits.indexOf("Apple") + 1;

console.log("Apple is found in position " + position1);
/////////////////////////////////////////////\
const numberse = [45, 4, 9, 16, 25];
let someOver18 = numberse.some(myFunctione);

console.log("Some over 18 is " + someOver18);

function myFunctione(value, index, array) {
  return value > 18;
}
///////////////////////////////////////
const f = fruits.entries();

for (let x of f) {
  console.log('x>>>>>>>>>>>>'+x);
}

    }

}