using Dapper;
using System.Data.SqlClient;

public static class BD {
    public static string _connectionString = @"Server=localhost;DataBase=FuthubBD;Trusted_Connection=True;";
    
    public static List<Jugador> GetJugadorByID(int idjug){
        LisT<Jugador> ListaJugador = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetJugadorByID";
            ListaJugador = db.Query<Jugador>(sp, new { IdJugador = idjug}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaJugador;
    }
    public static List<Equipo> GetEquipoByID(int idteam){
        LisT<Equipo> ListaEquipos = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetEquipoByID";
            ListaEquipos = db.Query<Equipo>(sp, new { IdEquipo = idteam}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaEquipos;
    }
    public static List<Usuario> GetUsuarioByID(int idUser){
        LisT<Usuario> ListaUsuarios = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetUsuarioByID";
            ListaUsuarios = db.Query<Usuario>(sp, new { IdUsuario = idUser}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaUsuarios;
    }
    public static List<Usuario> GetUsuarioByID(int idUser){
        LisT<Usuario> ListaUsuarios = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetUsuarioByID";
            ListaUsuarios = db.Query<Usuario>(sp, new { IdUsuario = idUser}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaUsuarios;
    }
    public static List<Usuario> GetJugadoresByEquipo(int idUser){
        LisT<Usuario> ListaUsuarios = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetJugadoresByEquipo";
            ListaUsuarios = db.Query<Usuario>(sp, new { IdUsuario = idUser}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaUsuarios;
    }
}