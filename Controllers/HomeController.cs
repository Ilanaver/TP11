using Microsoft.AspNetCore.Mvc;

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
        return View();
    }
    public IActionResult InfoEquipo()
    {
        return View();
    }
    public IActionResult Perfil()
    {
        return View();
    }

        return View("Inicio");
    }
}
