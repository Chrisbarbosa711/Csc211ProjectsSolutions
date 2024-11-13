#include <iostream>
using namespace std;
// Function definitions
int fun1(int a);
int fun2(int a, int b);

int main() {
    int a = 10;  // Represents initial value for a
    int b = 20;  // Represents initial value for b
    int c = 30;  // Represents initial value for c
    
    int d;

    // Perform calculations
    a = a + b + c;  // Sum a, b, and c, storing the result back in a

    // Call fun1 with a, store the return value in b
    b = fun1(a);

    // Set b to 10 after calling fun1
    b = 10;

    // Call fun2 with a and b
    d = fun2(a, b);
    
    // Output final values
    cout << "Final values:\n";
    cout << "a = " << a << endl;
    cout << "b = " << b << endl;
    cout << "c = " << c << endl;
    cout << "d = " << d << endl;

    return 0;
}

// Function to simulate MIPS fun1 logic
int fun1(int a) {
    int limit = 40;
    if (a < limit) {
        return 0;  // Equivalent to setting b to 0 if a < 40
    } else {
        return a - limit;  // Otherwise, return a - limit
        
    }
    
   
}

// Function to simulate MIPS fun2 logic
int fun2(int a, int b) {
    int multiplier = 10;  // Represents a constant
    return a * b + multiplier * b;  // Calculate the combined product and return
}



