<#import "spring.ftl" as spring/>
<html>
<head>
    <title>斗图--根据台词找截图</title>
    <link href="<@spring.url'/css/bootstrap.css'/>" rel="stylesheet"/>
    <link href="<@spring.url'/css/4-col-portfolio.css'/>" rel="stylesheet"/>
    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?c80f6a0fd1575b39849a0414b266713e";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>

</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="javascript:;" onclick="loadRandomImageList()">斗图</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

            <div style="float: right;position: relative;margin-top: 10px;width: 250px">
                <input type="search" name="keyWords" style="float: left;width: 170px" class="form-control"
                       placeholder="Search Here" onkeypress="if(event.keyCode==13) {btn.click();return false;}"/>
                <button class="btn btn-success" style="float: right;" onclick="searchImage()">Search</button>
            </div>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container">

    <div id="resultContainer">

    </div>

    <hr>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div id="imgContainer" style="text-align:center">
                        <img name="img-detail"
                             src="" alt=""
                             style="width: 700px;height: 540px;">
                    </div>

                    <div id="canvasContainer" style="display: none;text-align:center;height: 540px">
                        <canvas id="imgCanvas"
                                style="width: 700px;height: 540px;position: relative; left: 0; top: 0; z-index: 0;">

                        </canvas>
                        <canvas id="subtitleCanvas"
                                style="width: 700px;height: 540px;position: relative; left: 0; top: -540px; z-index: 1;">

                        </canvas>
                    </div>


                    <div id="customSubtitleContainer" style="display: none">
                        <input style="width: 400px;margin: 10px auto" type="text" name="subtitle" id="subtitle"
                               placeholder="输入字幕" class="form-control" oninput="updateSubtitle()">
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="showOrHideCustomSubtitleContainer()">我要改字幕
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <#include "base/footer.ftl">

</div>

<script src="<@spring.url'/js/jquery-2.2.0.min.js'/>"></script>
<script src="<@spring.url'/js/bootstrap.js'/>"></script>
<script>

    $(function () {
        loadRandomImageList();
        $('[name=keyWords]').bind('keypress', function (event) {
            if (13 === event.keyCode) {
                searchImage();
            }
        });
        $('#myModal').on('hidden.bs.modal', function () {
            $("#canvasContainer").css("display", "none");
            $("#imgContainer").css("display", "block");
            var $container = $("#customSubtitleContainer");
            if ($container.css("display") === "block") {
                $container.slideUp();
            }
        })
//        $("[name=subtitle]").onchange(,function () {
//            updateSubtitle()
//        })
    });

    function showDetailModal(uid) {
        $("#myModal").modal("show");
        $("#myModal .modal-body [name=img-detail]").attr("src", "http://ovhl8ni4q.bkt.clouddn.com/" + uid + ".jpg")
    }

    function showOrHideCustomSubtitleContainer() {
        var $container = $("#customSubtitleContainer");
        if ($container.css("display") === "block") {
            $container.slideUp();
        } else {
            $container.slideDown();
            $("#subtitle").val("");
            var canvas = document.getElementById("subtitleCanvas");
            var context = canvas.getContext("2d");
            context.clearRect(0, 0, 700, 540);
            initCanvasContainer()
        }
        $("[name=subtitle]").val();
    }

    function initCanvasContainer() {
        $("#canvasContainer").css("display", "block");
        $("#imgContainer").css("display", "none");
        var canvas = document.getElementById("imgCanvas");
        canvas.width = 700;
        canvas.height = 540;
        var context = canvas.getContext("2d");
        context.globalCompositeOperation = "source-over";
        var imageObj = new Image();
        imageObj.onload = function () {
            context.drawImage(imageObj, 0, 0, 700, 540);
        };
        imageObj.src = $("[name=img-detail]").attr("src").replace("ovhl8ni4q", "ovhni7gl2");
    }

    //  更新自定义的字幕
    function updateSubtitle() {
        var subtitle = $("#subtitle").val();
        var canvas = document.getElementById("subtitleCanvas");
        var context = canvas.getContext("2d");
        context.clearRect(0, 0, 700, 540);
        context.fillStyle = 'white';
        context.strokeStyle = 'black';
        context.font = '10px serif';
        context.textAlign = "center";
        context.fillText(subtitle, 150, 140);
//        context.strokeText(subtitle, 150, 140);
//        context.fill();
//        context.stroke();
    }

    function loadRandomImageList() {
        $.ajax({
            type: 'POST',
            url: '/image/discovery/',
            data: {},
            dataType: 'html',
            success: function (html) {
                $("#resultContainer").html(html)
            },
            error: function (error) {
                alert("error");
            }
        })
    }

    function searchImage() {
        var keyWords = $("[name=keyWords]").val();
        if (keyWords !== "") {
            $.ajax({
                url: "/image/searchImageByKeyWords",
                method: "POST",
                dataType: "html",
                data: {keyWords: keyWords},
                success: function (html) {
                    $("#resultContainer").html(html)
                },
                error: function (error) {
                    console.log(error)
                }
            })
        } else {
            alert("请输入搜索关键字!")
        }

    }

</script>

</body>

</html>