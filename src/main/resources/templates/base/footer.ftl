<#--<#import "spring.ftl" as spring/>spring-->

<footer>
    <div class="row">
        <div class="col-lg-12">
            <p class="text-muted">友情链接</p>
            <div id="friendlyLinkContainer">

            </div>
        </div>
        <div class="col-lg-12" style="padding-top: 20px">
            <p class="text-muted">Copyright &copy; 斗图 2017 沪ICP备15047920号-2</p>
        </div>
    </div>
    <!-- /.row -->
</footer>
<script src="<@spring.url'/js/jquery-2.2.0.min.js'/>"></script>

<script>

    $(function () {
        $.ajax({
            type: "POST",
            url: '/base/friendlyLinks/',
            data: {},
            dataType: 'html',
            success: function (html) {
                $("#friendlyLinkContainer").html(html);
            },
            error: function (error) {
                alert("error");
            }
        })
    })

</script>