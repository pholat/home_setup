# This is error colouring script, might color whatever word/lines
# TESTS positive plow:
# echo "error"
# echo "error "
# echo "error: "
# echo " error: asda"
# TESTS negative flow:
# echo " :error: "
# echo "eerror: "
# echo "eerro: "

BEGIN {
    fmt["B"]="\033[1m"; fmt["b"]="0\33[21m";
    green    ="\033[32m"
    red      ="\033[31m"
    magenta  ="\033[35m"
    nocol    ="\033[39m"

    arr[1]="error";
    arr[2]="warning";
    for( a in arr ) {
        arr[a] = "( |^)"arr[a]"[:s]{1,2}?([[:blank:]].*|$)"
    }
}
{
     if( tolower($0) ~ arr[1] ) {
         printf("%s%s%s%s%s\n", red, fmt["B"],$0, fmt["b"], nocol )
     } else if( tolower($0) ~ arr[2] ) {
         printf("%s%s%s%s%s\n", magenta, fmt["B"],$0, fmt["b"], nocol )
     } else {
         printf("%s\n",$0)
     }
}
