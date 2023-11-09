using Dapper;
using System.Data.SqlClient;
using System.Data;

public static class BD {
    public static string _connectionString = @"Server=localhost;DataBase=FuthubBD;Trusted_Connection=True;";
    
    public static List<Jugador> GetJugadorByID(int idjug){
        List<Jugador> ListaJugador = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetJugadorByID";
            ListaJugador = db.Query<Jugador>(sp, new { IdJugador = idjug}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaJugador;
    }
    public static List<Equipo> GetEquipoByID(int idteam){
        List<Equipo> ListaEquipos = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetEquipoByID";
            ListaEquipos = db.Query<Equipo>(sp, new { IdEquipo = idteam}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaEquipos;
    }
    public static List<Usuario> GetUsuarioByID(int idUser){
        List<Usuario> ListaUsuarios = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetUsuarioByID";
            ListaUsuarios = db.Query<Usuario>(sp, new { IdUsuario = idUser}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaUsuarios;
    }
    
    public static List<Jugador> GetJugadoresByEquipo(int idteam){
        List<Jugador> ListaJugadores = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetJugadoresByEquipo";
            ListaJugadores = db.Query<Jugador>(sp, new { IdEquipoActual = idteam}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaJugadores;
    }
    public static List<Jugador> GetJugadoresByPais(int idPais){
        List<Jugador> ListaJugadores = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetJugadoresByEquipo";
            ListaJugadores = db.Query<Jugador>(sp, new { IdPais = idPais}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaJugadores;
    }
    public static List<Comentario> GetComentarioByJugador(int idJugador){
        List<Comentario> ListaComentarios = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetComentarioByJugador";
            ListaComentarios = db.Query<Comentario>(sp, new { IdJugador = idJugador}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaComentarios;
    }
    public static List<Equipo> GetEquiposByPais(int idPais){
        List<Equipo> ListaEquipos = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetEquiposByPais";
            ListaEquipos = db.Query<Equipo>(sp, new { IdPais = idPais}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaEquipos;
    }
    public static List<TituloXEquipo> GetTitulosByEquipo(int idEquipo){
        List<TituloXEquipo> ListaTitulos = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetTitulosByEquipo";
            ListaTitulos = db.Query<TituloXEquipo>(sp, new { IdEquipo = idEquipo}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaTitulos;
    }
    public static List<Jugador> GetTENPlayers(){
        List<Jugador> ListaPlayers = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetTENPlayers";
            ListaPlayers = db.Query<Jugador>(sp, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaPlayers;
    }
}