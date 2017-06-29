<div>
<#list dialogueList as item>
    <#if item?index % 4 == 0>
    <div class="row">
    </#if>
    <div class="col-md-3 portfolio-item">
        <a href="javascript:;" onclick="showDetailModal('${item.uuid}')">
            <img class="img-responsive"
                 src="http://orzse20ix.bkt.clouddn.com/${item.uuid}.jpg" alt=""/>
        </a>
    </div>
    <#if item?index % 4 == 3 || item?index == dialogueList?size>
    </div>
    </#if>
</#list>
</div>