//<script>const cd_organizacao = {usuario.Cd};</script>
console.log("Hello from salvar-forms.js");
document.getElementById("btnSalvarForms").addEventListener("click", (e) => {
    e.preventDefault();

    console.log("Salvando dados...");

    const inputs = document.querySelectorAll(".inputsOrg input");
    inputs.forEach(el => {
        const cd = el.getAttribute("cd");
        const link = `./lib/salvarForms.aspx?cd=${cd}&&txt=${encodeURIComponent(el.value)}&&cd_organizacao=${cd_organizacao}`;
        fetch(link);
    });
})

document.querySelectorAll("[act=delete]").forEach(el => el.addEventListener("click", removerPergunta))

function removerPergunta(e) {
    e.preventDefault();

    console.log("Deletando pergunta...");
    const div = this.parentNode;
    const cd = div.getAttribute("cd");
    const link = `./lib/deletarPergunta.aspx?cd=${cd}&&cd_organizacao=${cd_organizacao}`;
    fetch(link).then(resp => resp.json()).then(resp => {
        if (resp.ok) div.remove();
        console.log(resp.msg);
    })
}