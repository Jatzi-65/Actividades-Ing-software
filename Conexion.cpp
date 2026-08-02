#include <iostream>
#include <windows.h>
#include <sqlext.h>
#include <sqltypes.h>
#include <sql.h>
#include <iomanip>

using namespace std;

void conectarBaseDeDatos() {
    SQLHANDLE sqlenvhandle;
    SQLHANDLE sqlconnectionhandle;
    SQLRETURN retcode;

    SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE, &sqlenvhandle);
    SQLSetEnvAttr(sqlenvhandle, SQL_ATTR_ODBC_VERSION, (SQLPOINTER)SQL_OV_ODBC3, 0);
    SQLAllocHandle(SQL_HANDLE_DBC, sqlenvhandle, &sqlconnectionhandle);

    SQLWCHAR retconstring[1024];

    retcode = SQLDriverConnect(sqlconnectionhandle,
        NULL,
        (SQLWCHAR*)L"DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost;DATABASE=EmpresaUNI;Trusted_Connection=yes;",
        SQL_NTS,
        retconstring,
        1024,
        NULL,
        SQL_DRIVER_NOPROMPT);

    if (retcode == SQL_SUCCESS || retcode == SQL_SUCCESS_WITH_INFO) {
        cout << "===========================================" << endl;
        cout << " Conexion a la Base de Datos: EXITOSA" << endl;
        cout << "===========================================" << endl << endl;
    }
    else {
        cout << "===========================================" << endl;
        cout << " Error al conectar a la Base de Datos." << endl;
        cout << "===========================================" << endl << endl;
    }
}

void imprimirSeparador() {
    cout << "+" << setfill('-')
        << setw(8) << "+" << setw(15) << "+"
        << setw(16) << "+" << setw(16) << "+"
        << setw(14) << "+" << setw(14) << "+"
        << setw(20) << "+" << setw(20) << "+"
        << setw(15) << "+" << setfill(' ') << endl;
}

void imprimirTablaEmpleados() {
    cout << "TABLA DE REPORTE DE EMPLEADOS (VACIA)\n";
    imprimirSeparador();

    cout << "| " << left
        << setw(6) << "Num" << "| "
        << setw(13) << "Nombre" << "| "
        << setw(14) << "Ap. Paterno" << "| "
        << setw(14) << "Ap. Materno" << "| "
        << setw(12) << "Fecha Nac." << "| "
        << setw(12) << "RFC" << "| "
        << setw(18) << "Nombre de Centro" << "| "
        << setw(18) << "Desc. del Puesto" << "| "
        << setw(13) << "Es Directivo?" << "|" << endl;

    imprimirSeparador();

    cout << "| " << left
        << setw(6) << " " << "| " << setw(13) << " " << "| "
        << setw(14) << " " << "| " << setw(14) << " " << "| "
        << setw(12) << " " << "| " << setw(12) << " " << "| "
        << setw(18) << " " << "| " << setw(18) << " " << "| "
        << setw(13) << " " << "|" << endl;

    imprimirSeparador();
}

int main() {
    cout << "Intentando conectar con el servidor local...\n" << endl;

    conectarBaseDeDatos();

    imprimirTablaEmpleados();

    cout << "\n";
    system("pause"); 
    return 0;
}