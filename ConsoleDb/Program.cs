using Npgsql;

namespace ConsoleDb;


class Program
{
    static string constr = "Server =127.0.0.1; Port =5432; Database =Northwind; User Id=postgres; Password=41264126";

    static void Main(string[] args)
    {
        string sql = "select * from shippers";
        NpgsqlConnection conn = new NpgsqlConnection(constr);
        NpgsqlCommand cmd = conn.CreateCommand();
        cmd.CommandText = sql;

        try
        {
            conn.Open();
            NpgsqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                Console.WriteLine(rdr[0] + " " + rdr[1] + " " + rdr[2]);

            }

        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }

        finally
        {
            if (conn.State == System.Data.ConnectionState.Open)
                conn.Close();

            Console.WriteLine("Hello");

            Console.WriteLine("Hello");
        }



    }
}

