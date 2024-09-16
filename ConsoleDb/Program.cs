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

            //Console.WriteLine("Hello");
        }

        #region ADO.NET Nesneleri

        /*Ado.net felsefesinde oncelikli olarak SqlConnection oluşturulmalidir.
         * 1-SqlConnection parametre olarak bir connection string alir. 
         * Sql connection bir cesit koprudur.
         * 
         * 2-SqlCommand: SqlConnection olmadan bu nesnenin bir anlami yoktur.
           Verilen Sql komutlarini calistirmaya yarar. Eger Select Cumlesi varsa
           ExecuteReader metodu calistirilir.
           eger Crud (Create, Update, Delete) islemleri yapilacak ise ExecuteNonQuery()
           metodu calistirilmalidir.

        */

        #endregion


        #region ExecuteScaler Metodu: count veya sum tarzı sorgularda
        //Eger tek bir sonuc donuyor ıse ExecuteScaler() metodu kullanilir.
        /*
         command.CommandText = sql;
        conn.Open();
        var sonuc = command.ExecuteScaler();
        Console.WriteLine(sonuc);
        conn.Close();

         */

        #endregion

        #region EntityFrameWork mantigi

        //Listelerle calisir. Listelere eklenen herbir obje icin insert,
        // degisikliklerde update, remove islemlerinde delete sorgularini calistirir.

        #endregion



    }
}

