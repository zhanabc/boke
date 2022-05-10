//.exchange 表示的是轮播图的大盒子， .image:表示装图片li的父级ul , .point:是轮播图下的小圆点 ，.left与.right是轮播图的左右箭头
	  	$(function(){
			var big=document.querySelector(".setion");
			        var image=document.querySelector(".image");
			        var point=document.querySelector(".point");
			        var left=document.querySelector(".left");
			        var right=document.querySelector(".right");
			        //以上是引入html的对象
			        big.addEventListener("mouseenter",function() {
			            left.style.display='block';
			            right.style.display='block';
			            clearInterval(timer);
			            timer=null;
			        })
			        big.addEventListener("mouseleave",function() {
			            left.style.display='none';
			            right.style.display='none';
			            timer =setInterval(function() {
			            right.click();
			        },2000)
			        //以上是将轮播图两侧的左右按键的隐藏和显现
			        })
			        for (var  i = 0; i < image.children.length; i++) {
			            var li =document.createElement('li');
			            point.appendChild(li);
			            li.setAttribute('index',i);
			        }  //自动化增加能播图下的小圆点（有多少张图片就有多个圆点）
			        var imageWidth=big.offsetWidth; //将图片宽度变量全局化
			        point.children[0].className='cl';   //将索引号为0的圆点赋予一个类名
			        for (let i = 0; i <point.children.length; i++) {
			            point.children[i].addEventListener('click',function() {
			                for (let i = 0; i <point.children.length; i++) {
			                point.children[i].className='';       //排它思想，除去小圆点的类名
			            }
			                this.className='cl';
			                var index =this.getAttribute("index");
			                num=index;    //我们点击圆点的时候要将得到的索引号传递给右点击左右按键的变量（两变量不相同要统一，不然出bug）
			                re=index;     //我们点击圆点的时候要将得到的索引号传递给左点击左右按键的变量（两变量不相同要统一，不然出bug）
			                var imageWidth=big.offsetWidth;
			                animate(image,-imageWidth*index)     //动画 
			            })
			        }
			        var first =image.children[0].cloneNode(true);
			        image.appendChild(first);
			        var num=0; //右点击事件的变量
			        var re=0;  //左点击事件的变量
			        var flag=true; //节流阀变量
			        right.addEventListener('click',function() {
			           if (flag) {
			               flag=false;
			            if (num==point.children.length) {
			                image.style.left=0;
			                num=0;
			                }
			            num++;
			            animate(image,-imageWidth*num,function() {
			                flag=true;
			            });
			            re++
			            if (re==point.children.length) {
			                re=0
			            }
			            for (let i = 0; i <point.children.length; i++) {
			                point.children[i].className='';
			            }
			            point.children[re].className='cl';
			        }
			        })
			        left.addEventListener('click',function() {
			            if (num==0) {
			                num=image.children.length-1;
			                image.style.left=-num*imageWidth+'px';
			          }
			            num--;
			            animate(image,-imageWidth*num)
			            re--;
			            if (re<0) {
			                re=point.children.length-1;
			            }
			            for (let i = 0; i <point.children.length; i++) {
			                point.children[i].className='';
			            }
			            point.children[re].className='cl';
			        })
			        var timer =setInterval(function() {
			            right.click();
			        },10000)
		})
		function animate(tage,point,callback) {
		    clearInterval(tage.timer);
		    tage.timer=setInterval(function() {
		        var step=(point-tage.offsetLeft)/10;
		        step=step > 0 ? Math.ceil(step) :Math.floor(step);
		        if (tage.offsetLeft==point) {
		            clearInterval(tage.timer);
		            if (callback) {
		                callback();
		            }
		        }
		        tage.style.left=tage.offsetLeft+step+'px';
		    },30)
		}
			
		