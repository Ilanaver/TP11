using Microsoft.AspNetCore.Mvc;
using TP11.Models;
namespace TP11.Controllers;

public class Account : Controller
{
    public IActionResult Registro(Usuario us)
    {
        BD.CrearUsuario(us);
        return RedirectToAction("Inicio","Home");
    }

    [HttpPost]
    public IActionResult Login(string username, string contraseña)
    {
        string contra;
        contra=BD.GetContraseñaPorUsername(username);
        if(contra==contraseña){
            return RedirectToAction("Inicio","Home");
        }else
        {
            return RedirectToAction("Index","Home");
        }
    }

    public IActionResult CambiarContraseña(string username, string nuevaContraseña)
    {
        BD.CambiarContraseña(username,nuevaContraseña);
        return RedirectToAction("Inicio","Home");
    }
}
