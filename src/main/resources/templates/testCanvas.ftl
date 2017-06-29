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
        context.fillRect(0, 0, 800, 600);

        context.font = "50px serif";
        context.textAlign = "center";
        context.strokeText("《CANVAS--画图》", 400, 300);
    }
</script>
</body>
</html>