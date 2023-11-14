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
    public IActionResult InfoJugador()
    {
        ViewBag.Jugador=BD.GetJugadorByID();
        return View();
    }
    public IActionResult InfoEquipo()
    {
        ViewBag.Equipo=BD.GetEquipoByID();
        return View();
    }
    public IActionResult Perfil()
    {
        return View();
    }

}
