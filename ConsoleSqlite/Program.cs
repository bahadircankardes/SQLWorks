using Microsoft.Data.Sqlite;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace ConsoleSqlite;

class Program
{

    static void Main(string[] args)
    {
        
        string constr = "Data Source=/Users/bahadircankardes/source/repos/Wissen2024/deneme.db";
        SqliteConnection conn = new SqliteConnection(constr);
        conn.Open();
        string sql = "insert into Categories (CategoryName,Description,CreateDate)";
        sql = sql + "values('Gida', 'Yeme Icme', '01.01.2024')";
        SqliteCommand cmd = new SqliteCommand(sql, conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        


    }
}

