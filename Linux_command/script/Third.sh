for arg in "$@"
do
    index=$(echo $arg | cut -d = -f 1)
    val=$(echo $arg | cut -d = -f 2)
    case $index in
        x) x=$val;;
        y) y=$val;;
        *)
    esac
done
((result=x+y))
echo "x+y=$result"

string1="Linux"
string2="hint"
echo "$string1 $string2"
string3="$string1 $string2"
string3+=" is a good tutorial "
echo $string3
subStr=${string3:0:10}
echo $subStr
