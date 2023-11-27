
document.querySelectorAll(".icon-about").forEach(el => {
    el.addEventListener("click", function () {
        let box = this.parentNode.querySelector(".box-acts");
        if (box.classList.contains("hidden")) box.classList.remove("hidden");
        else box.classList.add("hidden");
    })
})

function normalize() {
    document.querySelectorAll("#perguntas input").forEach((el, i) => el.setAttribute("cd", i + 1))
}

document.querySelectorAll("[act='delete']").forEach(el => {
    el.addEventListener("click", function () {
        let inputs = document.querySelectorAll("#perguntas input");
        if (inputs.length <= 5) return;
        this.parentNode.parentNode.remove();
    })
})

document.getElementById("btnAdicionar").addEventListener("click", (e) => {
    e.preventDefault();
    document.getElementById("perguntas").innerHTML += `<div class='flex justBetween position-relative'>
                    <input type='text' value='' class='full-width'>
                    <img src='./img/icons/more.png' class='icon-30 pointer icon-about' alt='icone de mais informações'>
                    <div class='box-acts hidden'>
                        <p class='pointer opt' act='delete'>Remover</p>
                    </div>
                </div>`;
})

document.getElementById("form1").addEventListener("submit", (e) => {
    e.preventDefault();
    normalize();
    // i -> valor qt. inicial de inputs
    // inp(N) -> Input
    // org -> Cd Organizacao
    let inputs = document.querySelectorAll("#perguntas input");

    let complemento = "";
    inputs.forEach((el, i) => complemento += `&&inp${i + 1}=${encodeURIComponent(el.value)}`);

    let link = `./lib/orgForms.aspx?i=${qt_inps_initial}&&qt=${inputs.length}&&org=${cd_organizacao}${complemento}`;
    fetch(link).then(resp => resp.json()).then(resp => {
        document.querySelector("body").innerHTML += resp.msg;
        mostrarMessage();
        setTimeout(() => window.location.reload(), 800)
    })
})