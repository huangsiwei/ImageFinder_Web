<#import "spring.ftl" as spring/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

<canvas id="canvas" style="width: 800px;height: 600px">

</canvas>

<script src="<@spring.url'/js/jquery-2.2.0.min.js'/>"></script>

<script>
    $(function () {
        draw();
    });

    function draw() {
        var canvas = document.getElementById("canvas");
        canvas.width = 800;
        canvas.height = 600;
        var context = canvas.getContext("2d");
        context.fillStyle = "#FFF";
        context.fillRect(0,0,800,600);

        //1. 使用`font`设置字体。
        context.font = "50px serif";
        //3. 使用`fillText()`方法显示字体。
        context.strokeText("《CANVAS--Draw on the Web》",50,300);
    }
</script>
</body>
</html>