using Dapper;
using System.Data.SqlClient;

public static class BD {
    public static string _connectionString = @"Server=localhost;DataBase=FuthubBD;Trusted_Connection=True;";
    
    public static List<Jugador> GetJugadorByID(int idjug){
        List<Jugador> ListaJugador = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetJugadorByID";
            ListaJugador = db.Query<Jugador>(sp, new { idJugador = idjug}, commandType: CommandType.StoredProcedure).ToLiST();
        }
        return ListaJugador;
    }
}