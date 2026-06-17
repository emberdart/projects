#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct person {
    short age;
    char name[100];
    char *longtext;
} Person;

int main()
{
    Person person1 = {0};

    printf("Enter your age: ");

    scanf("%hu", &person1.age);

    printf("Enter your name: ");

    // person1.name = malloc(100 * sizeof(char));
    scanf("%100s", person1.name);

    printf("Gimme a hunk of text: ");

    person1.longtext = malloc(100 * sizeof(char));
    scanf("%100s", person1.longtext);

    printf("Your name is %s and your age is %d and your hunk of text is %s", person1.name, person1.age, person1.longtext);

    return 0;
}

