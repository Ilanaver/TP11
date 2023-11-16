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
    public IActionResult Perfil()
    {
        return View();
    }

}
