var iamge=document.getElementById("iamge3");
var flag=true
function change_back(){
    if(flag==true){
        iamge3.style.display="block";
    }else{
        iamge3.style.display="none";
    }
    flag=!flag;
}
function Onloadbac(e){
    var fil=e.files[0];  //表示选择第一张图片
    if(window.FileReader){     //判断浏览器是否支持FileReader
        let fir=new FileReader();    //创建FileReader对象
        fir.readAsDataURL(fil);    //通过该方法将第一张图片读进FileReader对象当中去
        fir.onload=function(e){   //当读取图片成功后调用该方法 ，result表示事件对象
            var res=e.target.result;
            var body=document.getElementsByTagName("body");
            document.body.style.background = "url('" + res+ "') no-repeat";
            document.body.style.backgroundSize="cover";
        }
    }
}