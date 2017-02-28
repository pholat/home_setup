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
    arr[1]="error";
    arr[2]="warning";
    for( a in arr ) {
        arr[a] = "( |^)"arr[a]"[:s]{1,2}?([[:blank:]].*|$)"
    }
}
{
     if( tolower($0) ~ arr[1] ) {
         printf("\033[31m%s\033[0m\n",$0)
     } else if( tolower($0) ~ arr[2] ) {
         printf("\033[35m%s\033[0m\n",$0)
     } else {
         printf("%s\n",$0)
     }
}
