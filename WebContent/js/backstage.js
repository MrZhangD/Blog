
$('.article .side_a').click(function(){
	$(this).toggleClass('active');
	$('.article_box').toggle(500);
});

//选择图片后预览图片
//判断浏览器是否支持FileReader接口
if (typeof FileReader == 'undefined') {
    document.getElementById("xmTanDiv").InnerHTML = "<h1>当前浏览器不支持FileReader接口</h1>";
    //使选择控件不可操作
    document.getElementById("xdaTanFileImg").setAttribute("disabled", "disabled");
}

//选择图片，马上预览
function xmTanUploadImg(obj) {
    var file = obj.files[0];
    
    var reader = new FileReader();

    reader.onload = function (e) {
        console.log("成功读取....");

        var img = document.getElementById("xmTanImg");
        img.src = e.target.result;
        var pic = document.getElementById("pic");
        pic.src = e.target.result;
        //或者 img.src = this.result;  //e.target == this
    }
    reader.readAsDataURL(file);
}

