valid=1
count=1 
while [ $valid ]
do
    echo $count
    if [ $count -ge 5 ];
    then
        break
    fi
    ((count++))
done

for ((counter=6; counter<=10; counter++))
do
    echo "$counter"
done

echo "Enter number"
read num
if [[ $num -gt 10 && $num -lt 50 || ( $num -eq 0 || $num -eq -1 ) ]]
then
    case $num in
    0)
        echo "look this line code" # no ;;
        echo "lucky $num";; # need ;;
    -1)
        echo "lucky $num";;
    *) 
        echo "Congratulation";;
    esac
else
    echo "need number range between 10 to 50"
fi



