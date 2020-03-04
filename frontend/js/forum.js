
function showAnswer(n) {
    console.log(n);
    var div = document.getElementsByClassName(n);
    var button = document.getElementById(n + "button");
    console.log(div);
    console.log(button);
    for (let i = 0; i < div.length; i++) {
        if (div[i].style.display === "none") {
            div[i].style.display = "block";
            button.style.display = "none";
        }
    }
}