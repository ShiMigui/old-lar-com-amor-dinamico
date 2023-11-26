document.getElementById("form1").addEventListener("submit", (e) => {
    e.preventDefault();

    let inputs = document.querySelectorAll("#perguntas input");

    let complemento = "";
    inputs.forEach((el, i) => complemento += `&&inp${i + 1}=${encodeURIComponent(el.value)}`);
    let link = `./lib/userForms.aspx?qt=${inputs.length}&&animal=${cd_animal}&&usuario=${cd_usuario}&&org=${cd_organizacao}${complemento}`;
    console.log(link);
    fetch(link).then(resp => resp.json()).then(resp => {
        document.querySelector("body").innerHTML += resp.msg;
        mostrarMessage();
        if (resp.ok) setTimeout(() => window.location.reload(), 1500)
    })
})