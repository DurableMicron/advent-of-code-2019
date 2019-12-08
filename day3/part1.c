#include <stdio.h>
char getWiresFromFile();

int main()
{
   printf("Hello i can see this\n");
   char t = getWiresFromFile();
   printf("first char is %c",t);
   return 0;
}


// read the input file
char getWiresFromFile() 
{
   FILE *fp;
   char buff[535365365];

   fp = fopen("./input.txt","r");

   fgets(buff, 255, (FILE*)fp);
   printf("2: %s\n", buff );
   
   fgets(buff, 255, (FILE*)fp);
   printf("3: %s\n", buff );
   fclose(fp);
   return buff[0];
}