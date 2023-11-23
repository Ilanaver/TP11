using Dapper;
using System.Data.SqlClient;
using System.Data;
namespace TP11.Models;

public static class BD {
    public static string _connectionString = @"Server=localhost;DataBase=FuthubBD;Trusted_Connection=True;";
    
    private static string connectionString = @"Server=localhost;DataBase=ingreso;Trusted_Connection=True;";

    public static void CrearUsuario(Usuarioo us)
    {
        using (SqlConnection BD = new SqlConnection(connectionString))
        {
            string sql = "INSERT INTO Usuario([username],[contraseña],[nombre],[email],[telefono]) VALUES(@Username,@Contraseña,@Nombre,@Email,@Telefono)";
            BD.Execute(sql, new { Username = us.username, Contraseña = us.contraseña, Nombre = us.nombre, Email = us.email, Telefono = us.telefono });
        }
    }

    public static void CambiarContraseña(string Username, string nuevaContraseña)
    {
        using (SqlConnection BD = new SqlConnection(connectionString))
        {
            string sql = "UPDATE Usuario SET contraseña=@NuevaContraseña where username= @username";
            BD.Execute(sql, new { NuevaContraseña = nuevaContraseña, username = Username });
        }
    }

    public static Usuarioo mostrarDatos(int IdUsuario, string username, string nombre, string email, int telefono)
    {
        Usuarioo us = null;
        using (SqlConnection BD = new SqlConnection(connectionString))
        {
            string sql = "SELECT username, nombre, email, telefono from Usuario where idUsuario=@IDusuario";
            us = BD.QueryFirstOrDefault<Usuarioo>(sql, new { IdUsuario = IdUsuario });
        }
        return us;
    }

    public static string GetContraseñaPorUsername(string username)
    {
        string contraseña;
        using (SqlConnection BD = new SqlConnection(connectionString))
        {
            string sql = "SELECT contraseña FROM Usuario WHERE username=@Username";
            contraseña = BD.QueryFirstOrDefault<string>(sql, new { Username = username });
        }
        return contraseña;
    }


    public static Jugador GetJugadorByID(int idjug){
        Jugador UnJugador = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetJugadorByID";
            UnJugador = db.QueryFirstOrDefault<Jugador>(sp, new { IdJugador = idjug}, commandType: CommandType.StoredProcedure);
        }
        return UnJugador;
    }
    public static Equipo GetEquipoByID(int idteam){
        Equipo UnEquipo = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetEquipoByID";
            UnEquipo = db.QueryFirstOrDefault<Equipo>(sp, new { IdEquipo = idteam}, commandType: CommandType.StoredProcedure);
        }
        return UnEquipo;
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
    public static List<TituloXJugador> GetTitulosByJugador(int idJugador){
        List<TituloXJugador> ListaTitulos = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetTitulosByJugador";
            ListaTitulos = db.Query<TituloXJugador>(sp, new { IdJugador = idJugador}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaTitulos;
    }

    public static void InsertarJugador(Jugador jug){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "InsertarJugador";
            db.Execute(sp, new {IdPais = jug.IdPais,
            IdEquipoActual = jug.IdEquipoActual,
            Nombre = jug.Nombre,
            Imagen = jug.ImagenJugador,
            Edad = jug.Edad,
            Descripcion = jug.Descripcion,
            Posicion = jug.Posicion,
            PartidosJugados = jug.PartidosJugados,
            Goles = jug.Goles,
            Likes = jug.Likes,
            Dislikes = jug.Dislikes}, commandType: CommandType.StoredProcedure);
        }
    }

    public static List<ResultadoBusqueda> Busqueda(string buscado){
        List<ResultadoBusqueda> ListaResultados = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "Busqueda";
            ListaResultados = db.Query<ResultadoBusqueda>(sp, new {terminoBuscado=buscado}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaResultados;
    }

    public static List<Pais> GetPaises(){
        List<Pais> ListaPaises = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetPaises";
            ListaPaises = db.Query<Pais>(sp, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaPaises;
    }

    public static List<Equipo> GetEquipos(){
        List<Equipo> ListaEquipos = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetEquipos";
            ListaEquipos = db.Query<Equipo>(sp, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaEquipos;
    }
}