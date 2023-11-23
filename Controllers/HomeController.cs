using Microsoft.AspNetCore.Mvc;
using TP11.Models;
namespace TP11.Controllers;

public class HomeController : Controller
{
        public IActionResult Index()
    {
        return View();
    }
    
    public IActionResult Registro()
    {
        return View();
    }
    public IActionResult CambiarContraseña()
    {
        return View();
    }
    public IActionResult Inicio()
    {
        ViewBag.PrimerosJugadores=BD.GetTENPlayers();
        return View();
    }
    /*
    public IActionResult Busqueda(string terminoBuscado)
    {
        ViewBag.ListaResultados=BD.Busqueda(terminoBuscado);
        return View();
    }
    */
    public IActionResult InfoJugador(int IdJugador)
    {
        ViewBag.Jugador=BD.GetJugadorByID(IdJugador);
        ViewBag.TitulosJugador=BD.GetTitulosByJugador(IdJugador);
        return View();
    }
    public IActionResult InfoEquipo(int IdEquipo)
    {
        ViewBag.Equipo=BD.GetEquipoByID(IdEquipo);
        ViewBag.TitulosEquipo=BD.GetTitulosByEquipo(IdEquipo);
        ViewBag.ListaJugadores=BD.GetJugadoresByEquipo(IdEquipo);
        return View();
    }
    public IActionResult Perfil(int IdUsuario)
    {
        ViewBag.Perfil=BD.GetUsuarioByID(IdUsuario);
        return View();
    }

    
    /*

    public IActionResult AgregarJugador()
    {
        ViewBag.ListaPaises=BD.GetPaises();
        ViewBag.ListaEquipos=BD.GetEquipos();
        return View();
    }
    public IActionResult GuardarJugador(Jugador jug)
    {
        BD.InsertarJugador(jug);
        return RedirectToAction("InfoJugador",new{IdJugador=jug.IdJugador});
    }

    public IActionResult AgregarTituloJugador()
    {
        ViewBag.ListaPaises=BD.GetPaises();
        ViewBag.ListaEquipos=BD.GetEquipos();
        return View();
    }
*/
}