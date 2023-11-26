console.log("Hello from userForms.js");

const btnEnviar = document.getElementById("btnEnviar");
document.getElementById("form1").addEventListener("submit", (e) => {
    e.preventDefault()
    btnEnviar.setAttribute("disabled", "disabled");
    let complemento = "";
    inputs.forEach((el, i) => complemento += `&&inp${i + 1}=${encodeURIComponent(el.value)}`)

    let link = `./lib/formsUser.aspx?qt=${inputs.length}${complemento}&&u=${objForms.u}&&a=${objForms.a}&&o=${objForms.o}`;
    console.log(link);
    fetch(link).then(response => response.json()).then(response => {
        document.querySelector("body").innerHTML += response.msg;
        mostrarMessage();
        btnEnviar.removeAttribute("disabled");
        if (response.ok) window.location("index.aspx");
    })
})