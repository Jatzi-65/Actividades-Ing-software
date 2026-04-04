#include <iostream>

using namespace std;

int main() {
    double num1, num2;

    cout << "Escribe el primer número: ";
    cin >> num1;

    cout << "Escribe el segundo número: ";
    cin >> num2;

    cout << "La suma es: " << num1 + num2 << endl;
    cout << "La resta es: " << num1 - num2 << endl;
    cout << "La multiplicación es: " << num1 * num2 << endl;
    cout << "La división es: " << num1 / num2 << endl;

    return 0;
}