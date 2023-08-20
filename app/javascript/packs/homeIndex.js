window.userMenu = function()  {
    const button = document.getElementById("button");
    const userMenu = document.getElementById("user-menu");
    if (button.classList.contains("close")){
        userMenu.style.display = "flex";
        button.innerHTML = "▲";
        button.classList.remove("close");
    } else {
        userMenu.style.display = "none";
        button.innerHTML = "▼";
        button.classList.add("close");
    }    
}
