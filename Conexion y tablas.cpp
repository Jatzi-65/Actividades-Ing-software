#include <iostream>
#include <windows.h>
#include <sqlext.h>
#include <sqltypes.h>
#include <sql.h>
#include <iomanip>

using namespace std;

SQLHANDLE sqlenvhandle;
SQLHANDLE sqlconnectionhandle;
SQLHANDLE sqlstatementhandle;

void revisarErrorConsulta(SQLHANDLE handle) {
    SQLWCHAR sqlState[6], msg[SQL_MAX_MESSAGE_LENGTH];
    SQLINTEGER nativeError;
    SQLSMALLINT msgLen;
    SQLGetDiagRec(SQL_HANDLE_STMT, handle, 1, sqlState, &nativeError, msg, sizeof(msg), &msgLen);
    wcout << L"| ERROR DE SQL SERVER: " << msg << endl;
}

void conectarBaseDeDatos() {
    SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE, &sqlenvhandle);
    SQLSetEnvAttr(sqlenvhandle, SQL_ATTR_ODBC_VERSION, (SQLPOINTER)SQL_OV_ODBC3, 0);
    SQLAllocHandle(SQL_HANDLE_DBC, sqlenvhandle, &sqlconnectionhandle);

    SQLWCHAR retconstring[1024];
    SQLRETURN retcode = SQLDriverConnect(sqlconnectionhandle, NULL,
        (SQLWCHAR*)L"DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost;DATABASE=EmpresaUNI;Trusted_Connection=yes;",
        SQL_NTS, retconstring, 1024, NULL, SQL_DRIVER_NOPROMPT);

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

void imprimirSeparadorEmpleados() {
    cout << "+" << setfill('-')
        << setw(8) << "+" << setw(15) << "+"
        << setw(16) << "+" << setw(16) << "+"
        << setw(14) << "+" << setw(14) << "+"
        << setw(12) << "+" << setw(20) << "+"
        << setw(15) << "+" << setfill(' ') << endl;
}

void consultarEmpleados() {
    cout << "TABLA DE REPORTE DE EMPLEADOS\n";
    imprimirSeparadorEmpleados();
    cout << "| " << left
        << setw(6) << "Num" << "| "
        << setw(13) << "Nombre" << "| "
        << setw(14) << "Ap. Paterno" << "| "
        << setw(14) << "Ap. Materno" << "| "
        << setw(12) << "Fecha Nac." << "| "
        << setw(12) << "RFC" << "| "
        << setw(10) << "Centro" << "| "
        << setw(18) << "Desc. Puesto" << "| "
        << setw(13) << "Es Directivo?" << "|" << endl;
    imprimirSeparadorEmpleados();

    SQLAllocHandle(SQL_HANDLE_STMT, sqlconnectionhandle, &sqlstatementhandle);

    SQLRETURN ret = SQLExecDirect(sqlstatementhandle, (SQLWCHAR*)L"SELECT Numero_Empleado, Nombre, Apellido_Paterno, Apellido_Materno, Fecha_Nacimiento, RFC, Numero_Centro, Descripcion_Puesto, Directivo_Bandera FROM Empleado", SQL_NTS);

    if (ret != SQL_SUCCESS && ret != SQL_SUCCESS_WITH_INFO) {
        revisarErrorConsulta(sqlstatementhandle); // Imprime el error si te equivocaste en el nombre
    }
    else {
        SQLCHAR id[10], nombre[50], apPat[50], apMat[50], fecha[20], rfc[25], centro[15], desc[50], directivo[10];
        while (SQLFetch(sqlstatementhandle) == SQL_SUCCESS) {
            SQLGetData(sqlstatementhandle, 1, SQL_C_CHAR, id, sizeof(id), NULL);
            SQLGetData(sqlstatementhandle, 2, SQL_C_CHAR, nombre, sizeof(nombre), NULL);
            SQLGetData(sqlstatementhandle, 3, SQL_C_CHAR, apPat, sizeof(apPat), NULL);
            SQLGetData(sqlstatementhandle, 4, SQL_C_CHAR, apMat, sizeof(apMat), NULL);
            SQLGetData(sqlstatementhandle, 5, SQL_C_CHAR, fecha, sizeof(fecha), NULL);
            SQLGetData(sqlstatementhandle, 6, SQL_C_CHAR, rfc, sizeof(rfc), NULL);
            SQLGetData(sqlstatementhandle, 7, SQL_C_CHAR, centro, sizeof(centro), NULL);
            SQLGetData(sqlstatementhandle, 8, SQL_C_CHAR, desc, sizeof(desc), NULL);
            SQLGetData(sqlstatementhandle, 9, SQL_C_CHAR, directivo, sizeof(directivo), NULL);

            cout << "| " << left
                << setw(6) << id << "| "
                << setw(13) << nombre << "| "
                << setw(14) << apPat << "| "
                << setw(14) << apMat << "| "
                << setw(12) << fecha << "| "
                << setw(12) << rfc << "| "
                << setw(10) << centro << "| "
                << setw(18) << desc << "| "
                << setw(13) << directivo << "|" << endl;
        }
    }
    imprimirSeparadorEmpleados();
    SQLFreeHandle(SQL_HANDLE_STMT, sqlstatementhandle);
}

void imprimirSeparadorCatalogo() {
    cout << "+" << setfill('-') << setw(20) << "+" << setw(30) << "+" << setw(15) << "+" << setfill(' ') << endl;
}

void consultarCatalogo() {
    cout << "TABLA DE CATALOGO DE CENTROS\n";
    imprimirSeparadorCatalogo();
    cout << "| " << left << setw(18) << "Numero de Centro" << "| " << setw(28) << "Nombre de Centro" << "| " << setw(13) << "Ciudad" << "|" << endl;
    imprimirSeparadorCatalogo();

    SQLAllocHandle(SQL_HANDLE_STMT, sqlconnectionhandle, &sqlstatementhandle);

    SQLRETURN ret = SQLExecDirect(sqlstatementhandle, (SQLWCHAR*)L"SELECT Numero_Centro, Nombre_Centro, Ciudad FROM Centro_Trabajo", SQL_NTS);

    if (ret != SQL_SUCCESS && ret != SQL_SUCCESS_WITH_INFO) {
        revisarErrorConsulta(sqlstatementhandle);
    }
    else {
        SQLCHAR idCentro[20], nomCentro[50], ciudad[50];
        while (SQLFetch(sqlstatementhandle) == SQL_SUCCESS) {
            SQLGetData(sqlstatementhandle, 1, SQL_C_CHAR, idCentro, sizeof(idCentro), NULL);
            SQLGetData(sqlstatementhandle, 2, SQL_C_CHAR, nomCentro, sizeof(nomCentro), NULL);
            SQLGetData(sqlstatementhandle, 3, SQL_C_CHAR, ciudad, sizeof(ciudad), NULL);
            cout << "| " << left << setw(18) << idCentro << "| " << setw(28) << nomCentro << "| " << setw(13) << ciudad << "|" << endl;
        }
    }
    imprimirSeparadorCatalogo();
    SQLFreeHandle(SQL_HANDLE_STMT, sqlstatementhandle);
}

void imprimirSeparadorDirectivos() {
    cout << "+" << setfill('-') << setw(12) << "+" << setw(22) << "+" << setw(26) << "+" << setfill(' ') << endl;
}

void consultarDirectivos() {
    cout << "TABLA DE DIRECTIVOS\n";
    imprimirSeparadorDirectivos();
    cout << "| " << left << setw(10) << "Num Emp" << "| " << setw(20) << "Centro Supervisado" << "| " << setw(24) << "Prestacion Combustible" << "|" << endl;
    imprimirSeparadorDirectivos();

    SQLAllocHandle(SQL_HANDLE_STMT, sqlconnectionhandle, &sqlstatementhandle);

    SQLRETURN ret = SQLExecDirect(sqlstatementhandle, (SQLWCHAR*)L"SELECT Numero_Empleado, Nombre, Apellido_Paterno, Apellido_Materno, Fecha_Nacimiento, RFC, Numero_Centro, Descripcion_Puesto, Directivo_Bandera FROM Empleado", SQL_NTS);

    if (ret != SQL_SUCCESS && ret != SQL_SUCCESS_WITH_INFO) {
        revisarErrorConsulta(sqlstatementhandle);
    }
    else {
        SQLCHAR idEmp[20], centroSup[50], prestacion[20];
        while (SQLFetch(sqlstatementhandle) == SQL_SUCCESS) {
            SQLGetData(sqlstatementhandle, 1, SQL_C_CHAR, idEmp, sizeof(idEmp), NULL);
            SQLGetData(sqlstatementhandle, 2, SQL_C_CHAR, centroSup, sizeof(centroSup), NULL);
            SQLGetData(sqlstatementhandle, 3, SQL_C_CHAR, prestacion, sizeof(prestacion), NULL);
            cout << "| " << left << setw(10) << idEmp << "| " << setw(20) << centroSup << "| " << setw(24) << prestacion << "|" << endl;
        }
    }
    imprimirSeparadorDirectivos();
    SQLFreeHandle(SQL_HANDLE_STMT, sqlstatementhandle);
}

int main() {
    cout << "Intentando conectar con el servidor local...\n" << endl;
    conectarBaseDeDatos();

    consultarEmpleados();
    cout << "\n\n";
    consultarCatalogo();
    cout << "\n\n";
    consultarDirectivos();

    cout << "\n";
    system("pause");
    return 0;
}