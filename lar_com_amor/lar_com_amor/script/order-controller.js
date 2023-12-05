function addEventsToIcons() {
    document.querySelectorAll(".icon-accept-order").forEach(el => el.addEventListener("click", AceitarPedido))
    document.querySelectorAll(".icon-refuse-order").forEach(el => el.addEventListener("click", RecusarPedido))
}

function AceitarPedido() {
    console.log("Aceitando pedido...");
    const ic = confirm("Você deseja confirmar este pedido?");
    if (!ic) 
    {
        console.log("Pedido não confirmado");
        return;
    }

    const u = this.getAttribute("u");
    const a = this.getAttribute("a");
    const dt = this.getAttribute("dt");

    console.log("> Permitido");

    fetch(`./lib/acceptOrder.aspx?u=${u}&&a=${a}&&dt=${dt}`).then(resp=>resp.json()).then(resp=>{
        if(resp.ok) window.location.reload();
    })
}

function RecusarPedido() {
    console.log("Cancelando pedido...");
    const ic = confirm("Você deseja cancelar este pedido?");
    if (!ic) 
    {
        console.log("Pedido não cancelado");
        return;
    }

    const u = this.getAttribute("u");
    const a = this.getAttribute("a");
    const dt = this.getAttribute("dt");

    console.log("> Cancelado");

    fetch(`./lib/refuseOrder.aspx?u=${u}&&a=${a}&&dt=${dt}`).then(resp => resp.json()).then(resp => {
        console.log(resp)
        if(resp.ok) window.location.reload();
    })
}

addEventsToIcons()