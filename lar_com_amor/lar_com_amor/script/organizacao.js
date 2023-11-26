const table = document.querySelector("table");
if (table != null) {
    table.querySelectorAll("tr").forEach((el, i) => {
        if (i % 2 == 1) el.classList.add("markLine");
    })
}