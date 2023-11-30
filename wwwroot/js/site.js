// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.



function verificarContraseña() {
    let campoContraseña = document.getElementById('contraseña1').value;
    let campoContraseña2 = document.getElementById('contraseña2').value;
    let verificada=campoContraseña.length >= 8 && campoContraseña==campoContraseña2
    if (verificada==false){
        const error=document.getElementById('errorIngreso')
        error.innerHTML="Revise que las contraseñas sean iguales o que tengan 8 dígitos o más"
    }
    return verificada

}

function hola(params) {
    Swal.fire({
        position: "top-end",
        icon: "success",
        title: "Your work has been saved",
        showConfirmButton: false,
        timer: 1500
      });
}


function ActualizarLikes(IdJugador) 
{
    $.ajax(
        {
            type:'POST',
            dataType:'JSON',
            url:'/Home/DarLike',
            data:{IdJugador: IdJugador},
            success:
            function(response){
                
            }
        }
    )
}


$("#NombreSerie").html(response.nombre);
$("#FotoSerie").attr("src",response.imagenSerie);
$("#AñoInicio").html(response.añoInicio);
$("#Sinopsis").html(response.sinopsis);
vaciarHTMLActores();
vaciarHTMLTemporadas();