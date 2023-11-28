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

function estoyDeAcuerdo(){
    (async () => {
        const { value: accept } = await Swal.fire({
          title: "Terms and conditions",
          input: "checkbox",
          inputValue: 1,
          inputPlaceholder: `
            I agree with the terms and conditions
          `,
          confirmButtonText: `
            Continue&nbsp;<i class="fa fa-arrow-right"></i>
          `,
          inputValidator: (result) => {
            return !result && "You need to agree with T&C";
          }
        });
        if (accept) {
          Swal.fire("You agreed with T&C :)");
        }
      })()
}