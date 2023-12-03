function carregarMais(e) {
    e.preventDefault();

    const grid = this.parentNode.parentNode.querySelector(".anunciosGrid");
    const i = grid.querySelectorAll("a").length;
    const sg = grid.getAttribute("sg");
    this.setAttribute("disabled", "disabled");

    const link = `./lib/maisAnuncios.aspx?offset=${i}&&sg=${sg}`;
    fetch(link).then(resp => resp.json()).then(resp => {
        if (resp.ok === "false") return;

        for (let n in resp.anuncios) grid.innerHTML += resp.anuncios[n];
        if (resp.more === "true") this.removeAttribute("disabled");
    })
}