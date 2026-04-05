#include <iostream>
#include <string>
#include <cctype> 
using namespace std;

class Empleado {
private:
    string nombre, apellidoPaterno, apellidoMaterno;
    int dia, mes, año;

public:
    Empleado(string n, string ap, string am, int d, int m, int a) {
        nombre = n;
        apellidoPaterno = ap;
        apellidoMaterno = am;
        dia = d;
        mes = m;
        año = a;
    }

    bool esVocal(char c) {
        c = toupper(c);
        return (c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U');
    }

    string calcularRFC() {
        string rfc = "";

        rfc += toupper(apellidoPaterno[0]);
        for (int i = 1; i < apellidoPaterno.length(); i++) {
            if (esVocal(apellidoPaterno[i])) {
                rfc += toupper(apellidoPaterno[i]);
                break;
            }
        }

        if (apellidoMaterno == "" || apellidoMaterno == " ") {
            rfc += 'X';
        } else {
            rfc += toupper(apellidoMaterno[0]);
        }

        rfc += toupper(nombre[0]);

        string sAño = to_string(año);
        rfc += sAño.substr(sAño.length() - 2);

        if (mes < 10) rfc += "0";
        rfc += to_string(mes);

        if (dia < 10) rfc += "0";
        rfc += to_string(dia);

        rfc += "XXX";

        return rfc;
    }
};

int main() {
    string n, ap, am;
    int d, m, a;

    cout << "--- Generador de RFC AMC ---" << endl;
    cout << "Nombre: "; cin >> n;
    cout << "Apellido Paterno: "; cin >> ap;
    cout << "Apellido Materno (si no tiene, presione espacio): "; 
    cin.ignore();
    getline(cin, am); 
    cout << "Dia de nacimiento: "; cin >> d;
    cout << "Mes: "; cin >> m;
    cout << "Año: "; cin >> a;

    Empleado nuevoEmpleado(n, ap, am, d, m, a);

    cout << "\nEl RFC generado es: " << nuevoEmpleado.calcularRFC() << endl;

    return 0;
}