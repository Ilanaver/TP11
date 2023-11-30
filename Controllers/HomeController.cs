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
        if(BD.user != null)
        {
            ViewBag.PrimerosJugadores=BD.GetTENPlayers();
            return View("Inicio");
        }else{
            return View("Index");
        }
        
    }
    
    public IActionResult Busqueda(string terminoBuscado)
    {
        if(BD.user != null){
        ViewBag.terminoBuscado=terminoBuscado;
        ViewBag.ListaResultados=BD.Busqueda(terminoBuscado);
        return View("Busqueda");
        }else{
            return View("Index");
        }
        
    }
    
    public IActionResult InfoJugador(int IdJugador)
    {
        ViewBag.Jugador=BD.GetJugadorByID(IdJugador);
        ViewBag.TitulosJugador=BD.GetTitulosByJugador(IdJugador);
        ViewBag.ComentariosJugador=BD.GetComentarioByJugador(IdJugador);
        return View();
    }
    public IActionResult InfoEquipo(int IdEquipo)
    {
        ViewBag.Equipo=BD.GetEquipoByID(IdEquipo);
        ViewBag.TitulosEquipo=BD.GetTitulosByEquipo(IdEquipo);
        ViewBag.ListaJugadores=BD.GetJugadoresByEquipo(IdEquipo);
        return View();
    }
    public IActionResult Perfil(string username)
    {
        ViewBag.Perfil=BD.GetUsuarioByUsername(username);
        return View();
    }
    

    public IActionResult AgregarJugador()
    {
        
        return View();
        if(BD.user != null){
            ViewBag.ListaPaises=BD.GetPaises();
            ViewBag.ListaEquipos=BD.GetEquipos();
        return View();
        }else{
            return View("Index");
        }
    }
    public IActionResult GuardarJugador(Jugador jug)
    {
        BD.InsertarJugador(jug);
        return RedirectToAction ("Inicio", "Home");
    }

    public IActionResult AgregarTituloJugador()
    {
        ViewBag.ListaPaises=BD.GetPaises();
        ViewBag.ListaEquipos=BD.GetEquipos();
        return View();
    }

    public IActionResult AgregarComentario(Comentario com)
    {
        BD.InsertarComentario(com);
        return RedirectToAction ("InfoJugador",new{IdJugador=com.IdJugador});
    }

     public IActionResult DarLike(int IdJugador)
    {
        BD.ModificarLikes(IdJugador);
        return RedirectToAction ("InfoJugador",new{IdJugador=IdJugador});
    }
    
}