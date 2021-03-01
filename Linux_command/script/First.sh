echo "
Hello
world"
((area=5*5))
echo $area
valid=trued
count=1
echo $valid
if [ $count -lt 10 ];then
    echo "condition is true $count"
elif [ $count -gt 20 ];then
    echo "condition is true $count"
else
    echo "condition is false $count"
fi
echo "pass parameter"
echo $1
array=("$@")
echo "all parameter" $@
echo "array[0] value : " ${array[0]}
echo "array[1] value : " ${array[1]}
