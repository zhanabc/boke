var iamge=document.getElementById("iamge1");
var flag=true
function Inset(){
    if(flag==true){
        iamge.style.display="block";
    }else{
        iamge.style.display="none";
    }
    flag=!flag;
}
function OnloadImage(souce){  //当文件上传input内容改变时触发，并传入文件对象集合
    var file=souce.files[0];  //表示选择第一张图片
    if(window.FileReader){     //判断浏览器是否支持FileReader
        let fire=new FileReader();    //创建FileReader对象
        fire.readAsDataURL(file);    //通过该方法将第一张图片读进FileReader对象当中去
        fire.onload=function(e){   //当读取图片成功后调用该方法 ，result表示事件对象
            const str =
                "<img style='width:40%' src='" +
                e.target.result +
                "'><br /><br />";
            var text=document.getElementById("text");
            text.innerHTML=text.innerHTML+str;
        }
    }
}