#include <stdio.h>
#include <stdlib.h>

char *get_string(int *len, int *test) {
    *len = 0; 
    *test = 0;
    int capacity = 1; 
    char *s = (char*) malloc(sizeof(char)); 
    char c = getchar();
    if(c > 127){
      (*test)++;
    }  
    while (c != '\n') {
        s[(*len)++] = c; 
        if (*len >= capacity) {
            capacity *= 2; 
            s = (char*) realloc(s, capacity * sizeof(char)); 
        }

        c = getchar();
	if(c > 127){
          (*test)++;
        }          
    }
    s[*len] = '\0'; 
    return s; 
}

int main() {
    int len, test; 
    char c;
    int counter;
    char *s = get_string(&len, &test);
    counter = len - 1;
    if(test == 0){
      for(int i = 0; i < len / 2;i++){
        c = s[i];
	s[i] = s[counter];
	s[counter] = c;
	counter = counter - 1;
      }
      printf("%s\n", s);
      return 0; 
    }
    else{
      printf("incorrect input");
      return 0;
    }
    free(s); 
    return 0;
}