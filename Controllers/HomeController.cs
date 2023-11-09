using Microsoft.AspNetCore.Mvc;

namespace TP11.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        ViewBag.PrimerosJugadores=BD.GetTENPlayers();

        return View("Inicio");
    }
}
