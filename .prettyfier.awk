{
     if( match(tolower($0),/ error[s]?[:blank:].*/) ) {
         printf("\033[31m%s\033[0m\n",$0)
     } else if(tolower($0)~/warning[s]?[:blank:].*/) {
         printf("\033[33m%s\033[0m\n",$0)
     } else {
         printf("%s\n",$0)
     }
}

