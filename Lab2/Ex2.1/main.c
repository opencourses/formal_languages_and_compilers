/* Example of Bubble sorting algorithm*/

double x[5];
int i, j;
double swap;
int pos;

/* Vector initialization */
x[0] = -2.0;
x[1] = -3.0;
x[2] = 3.0;
x[3] = 5.0;
x[4] = 2.5;

/* Bubble sort */
pos = 5;
while(pos > 0){
    i = 0;
    while (i < pos-1){
        j = i+1;
        if (x[i] > x[j]){
            swap = x[j];
            x[j] = x[i];
            x[i] = swap;
        }
        i = i+1;
    }
    pos = pos-1;
}

/* Print results */
i=0;
while(i<5){
    print(x[i]);
    i = i+1;
}
