/*
 <script>
                cosnt cd_animal = {a};
                cosnt cd_adotante = {u};
                cosnt dt_pedido = {dt};
            </script>
 */
console.log("Hello from forms-user.js");

document.addEventListener("submit", (e) => {
    e.preventDefault();

    let complement = "";
    const inputs = document.querySelectorAll("#perguntas input")
    let cdsArray = [];
    inputs.forEach(el => {
        complement += `&&${el.id}=${encodeURIComponent(el.value)}`;
        cdsArray.push(el.getAttribute("cd"));
    });

    let cds = "&&cds=" + cdsArray.join(",");

    let link = `./lib/responderFormulario.aspx?${cds}&&cd_adotante=${cd_adotante}&&cd_animal=${cd_animal}&&dt_pedido=${dt_pedido}${complement}`;
    console.log(link);
    fetch(link).then(resp => resp.json()).then(resp => {

        if (resp.ok) window.location.reload();

        document.querySelector("body").innerHTML += resp.msg;
        mostrarMessage();
    });
});