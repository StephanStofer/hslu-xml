function showAnswer(n) {
    console.log(n);
    var div= document.getElementById(n);
    var button= document.getElementById(n+"button");
    console.log(button);
    if(div.style.display === "none"){
        div.style.display = "block";
        button.style.display = "none";
    }
}