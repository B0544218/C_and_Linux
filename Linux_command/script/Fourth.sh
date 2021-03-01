function practice1(){
str="hello world"
echo $str
}
practice1

# pass value with read
function practice2(){
echo "input 2 numbers"
read num1
read num2
sum=$(($num1+$num2))
echo "you input $num1 , $num2 ="
echo $sum
}
practice2

function practice3(){
str="Hello $name"
echo $str
}
echo "Enter your name"
read name
val=$(practice3)
echo "Return value of the function is ' $val '"


