<#import "spring.ftl" as spring/>
<html>
<head>
    <title></title>
    <link href="<@spring.url'/css/bootstrap.css'/>" rel="stylesheet"/>
    <link href="<@spring.url'/css/4-col-portfolio.css'/>" rel="stylesheet"/>

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

    <hr>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="img-container" style="text-align:center">
                        <img name="img-detail"
                             src="" alt=""
                             style="width: 350px;height: 270px;">
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">我要改字幕</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="row">
            <div class="col-lg-12">
                <p>Copyright &copy; Your Website 2014</p>
            </div>
        </div>
        <!-- /.row -->
    </footer>
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
    });

    function showDetailModal(uuid) {
        $("#myModal").modal("show");
        $("#myModal .modal-body [name=img-detail]").attr("src", "http://orzse20ix.bkt.clouddn.com/" + uuid + ".jpg")
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
    }

</script>

</body>

</html>