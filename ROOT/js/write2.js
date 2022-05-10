var flag=true
function change(){
    var color=document.getElementById("font-class");
    if(flag==true){
        color.style.display="block";
    }else{
        color.style.display="none";
    }
    flag=!flag;
}