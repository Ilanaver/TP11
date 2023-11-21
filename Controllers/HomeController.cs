using Microsoft.AspNetCore.Mvc;
using TP11.Models;
namespace TP11.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        ViewBag.PrimerosJugadores=BD.GetTENPlayers();
        return View();
    }
    public IActionResult Busqueda()
    {
        return View();
    }
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
        return View();
    }
    public IActionResult Perfil(int IdUsuario)
    {
        ViewBag.Perfil=BD.GetUsuarioByID(IdUsuario);
        return View();
    }

    public IActionResult AgregarJugador()
    {
        /*ViewBag.ListaPaises=BD.GetPaises();
        ViewBag.ListaEquipos=BD.GetEquipos()*/
        return View();
    }
    public IActionResult GuardarJugador(Jugador jug)
    {
        //BD.InsertarJugador(jug);
        return RedirectToAction("InfoJugador",new{IdJugador=jug.IdJugador});
    }
}
