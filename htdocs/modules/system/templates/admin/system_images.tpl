<!-- Header -->
<{includeq file="db:system_header.tpl"}>
<!-- Buttons -->
<div class="floatright">
    <div class="xo-buttons">
        <{if !$edit_form && !$listimg}>
            <button id="xo-addcat-btn" class="ui-corner-all tooltip" onclick="xo_toggle('div#xo-category-add');"
                    title="<{$smarty.const._AM_SYSTEM_IMAGES_ADDCAT}>">
                <img src="<{xoAdminIcons add.png}>" alt="<{$smarty.const._AM_SYSTEM_IMAGES_ADDCAT}>"/>
                <{$smarty.const._AM_SYSTEM_IMAGES_ADDCAT}>
            </button>
        <{/if}>
        <{if $cat_img || $listimg}>
            <button id="xo-addimg-btn" class="ui-corner-all tooltip" onclick="xo_toggle('div#xo-images-add');"
                    title="<{$smarty.const._AM_SYSTEM_IMAGES_ADDIMG}>">
                <img src="<{xoAdminIcons add.png}>" alt="<{$smarty.const._AM_SYSTEM_IMAGES_ADDIMG}>"/>
                <{$smarty.const._AM_SYSTEM_IMAGES_ADDIMG}>
            </button>
        <{/if}>
    </div>
</div>
<!-- Category List -->
<{if !$edit_form && !$listimg}>
    <table class="outer" cellspacing="1">
        <thead>
        <tr>
            <th><{$smarty.const._AM_SYSTEM_IMAGES_NAME}></th>
            <th><{$smarty.const._AM_SYSTEM_IMAGES_NBIMAGES}></th>
            <th><{$smarty.const._AM_SYSTEM_IMAGES_MAXSIZE}></th>
            <th><{$smarty.const._AM_SYSTEM_IMAGES_MAXWIDTH}></th>
            <th><{$smarty.const._AM_SYSTEM_IMAGES_MAXHEIGHT}></th>
            <th><{$smarty.const._AM_SYSTEM_IMAGES_DISPLAY}></th>
            <th><{$smarty.const._AM_SYSTEM_IMAGES_ACTIONS}></th>
        </tr>
        </thead>
        <tbody>
        <{foreach item=cat from=$cat_img}>
            <tr class="<{cycle values='odd, even'}> txtcenter">
                <td>
                    <a class="tooltip" href="admin.php?fct=images&amp;op=listimg&amp;imgcat_id=<{$cat.id}>" title="<{$smarty.const._AM_SYSTEM_IMAGES_VIEW}>">
                        <{$cat.name}>
                    </a>
                </td>
                <td><{$cat.count}></td>
                <td><{$cat.maxsize}></td>
                <td><{$cat.maxwidth}></td>
                <td><{$cat.maxheight}></td>
                <td class="xo-actions"><img id="loading_cat<{$cat.id}>" src="./images/spinner.gif" style="display:none;"
                                            alt="<{$smarty.const._AM_SYSTEM_LOADING}>"/><img class="cursorpointer tooltip" id="cat<{$cat.id}>"
                                                                                             onclick="system_setStatus( { fct: 'images', op: 'display_cat', imgcat_id: <{$cat.id}> }, 'cat<{$cat.id}>', 'admin.php' )"
                                                                                             src="<{if $cat.display}><{xoAdminIcons success.png}><{else}><{xoAdminIcons cancel.png}><{/if}>"
                                                                                             alt=""
                                                                                             title="<{if $cat.display}><{$smarty.const._AM_SYSTEM_IMAGES_OFF}><{else}><{$smarty.const._AM_SYSTEM_IMAGES_ON}><{/if}>"/>
                </td>
                <td class="xo-actions txtcenter">
                    <a class="tooltip" href="admin.php?fct=images&amp;op=listimg&amp;imgcat_id=<{$cat.id}>" title="<{$smarty.const._AM_SYSTEM_IMAGES_VIEW}>">
                        <img src="<{xoAdminIcons display.png}>" alt="<{$smarty.const._AM_SYSTEM_IMAGES_VIEW}>"/>
                    </a>
                    <{if $xoops_isadmin}>
                        <a class="tooltip" href="admin.php?fct=images&amp;op=editcat&amp;imgcat_id=<{$cat.id}>" title="<{$smarty.const._EDIT}>">
                            <img src="<{xoAdminIcons edit.png}>" alt="<{$smarty.const._EDIT}>"/>
                        </a>
                        <a class="tooltip" href="admin.php?fct=images&amp;op=delcat&amp;imgcat_id=<{$cat.id}>" title="<{$smarty.const._EDIT}>">
                            <img src="<{xoAdminIcons delete.png}>" alt=""/>
                        </a>
                    <{/if}>
                </td>
            </tr>
        <{/foreach}>
        <{if !$cat_img}>
            <tr>
                <td class="txtcenter bold odd" colspan="7"><{$smarty.const._AM_SYSTEM_IMAGES_NOCAT}></td>
            </tr>
        <{/if}>
        </tbody>
    </table>
    <!-- Nav menu -->
    <{if $nav_menu}>
        <div class="xo-avatar-pagenav floatright"><{$nav_menu}></div>
        <div class="clear spacer"></div>
    <{/if}>
<{/if}>
<{if $images}>
    <!-- Image list -->
    <div id="xo-category-add" class="">
        <{foreach item=img from=$images}>
            <div class="floatleft">
                <div class="ui-corner-all xo-thumb txtcenter">
                    <div class="xo-thumbimg">
                        <img class="tooltip" src="<{$xoops_url}>/image.php?id=<{$img.image_id}>&amp;width=120&amp;height=120" alt="<{$img.image_nicename}>"
                             title="<{$img.image_nicename}>" style="max-width:120px; max-height:120px;"/>
                    </div>
                    <div class="xo-actions txtcenter">
                        <div class="spacer bold"><{$img.image_nicename}></div>
                        <img id="loading_img<{$img.image_id}>" src="./images/spinner.gif" style="display:none;"
                             alt="<{$smarty.const._AM_SYSTEM_LOADING}>"/><img class="cursorpointer tooltip" id="img<{$img.image_id}>"
                                                                              onclick="system_setStatus( { fct: 'images', op: 'display_img', image_id: <{$img.image_id}> }, 'img<{$img.image_id}>', 'admin.php' )"
                                                                              src="<{if $img.image_display}><{xoAdminIcons success.png}><{else}><{xoAdminIcons cancel.png}><{/if}>"
                                                                              alt="<{$smarty.const._IMGDISPLAY}>" title="<{$smarty.const._IMGDISPLAY}>"/>
                        <{if !$db_store}>
                        <a class="lightbox tooltip" href="<{$xoops_upload_url}>/<{$img.image_name}>" title="<{$smarty.const._PREVIEW}>">
                            <{else}>
                            <a class="lightbox tooltip" href="<{$xoops_url}>/image.php?id=<{$img.image_id}>" title="<{$smarty.const._PREVIEW}>">
                                <{/if}>
                                <img src="<{xoAdminIcons display.png}>" alt="<{$smarty.const._AM_SYSTEM_IMAGES_VIEW}>"/>
                            </a>
                            <a class="tooltip" href="admin.php?fct=images&amp;op=editimg&amp;image_id=<{$img.image_id}>" title="<{$smarty.const._EDIT}>">
                                <img src="<{xoAdminIcons edit.png}>" alt="<{$smarty.const._EDIT}>"/>
                            </a>
                            <a class="tooltip" href="admin.php?fct=images&amp;op=delfile&amp;image_id=<{$img.image_id}>" title="<{$smarty.const._DELETE}>">
                                <img src="<{xoAdminIcons delete.png}>" alt="<{$smarty.const._DELETE}>"/>
                            </a>
                            <img class="tooltip" onclick="display_dialog(<{$img.image_id}>, true, true, 'slide', 'slide', 120, 350);"
                                 src="<{xoAdminIcons url.png}>" alt="<{$smarty.const._AM_SYSTEM_IMAGES_URL}>"
                                 title="<{$smarty.const._AM_SYSTEM_IMAGES_URL}>"/>
                    </div>
                </div>
            </div>
            <div id="dialog<{$img.image_id}>" title="<{$img.image_nicename}>" style='display:none;'>
                <div class="center">
                    <{if !$db_store}>
                        <{$xoops_upload_url}>/<{$img.image_name}>
                    <{else}>
                        <{$xoops_url}>/image.php?id=<{$img.image_id}>
                    <{/if}>
                </div>
            </div>
        <{/foreach}>
        <div class="clear"></div>
    </div>
    <{if $nav_menu}>
        <div class="xo-avatar-pagenav floatright"><{$nav_menu}></div>
        <div class="clear spacer"></div>
    <{/if}>
<{else}>
    <div id="xo-category-add" class="">
        <div class="clear"></div>
    </div>
<{/if}>

<!-- Add Image form -->
<div id="xo-images-add" class="hide">
    <br>
    <{$image_form.javascript}>
    <form name="<{$image_form.name}>" id="<{$image_form.name}>" action="<{$image_form.action}>" method="<{$image_form.method}>"
            <{$image_form.extra}> >
        <table class="outer">
            <tr>
                <th colspan="2"><{$image_form.title}></th>
            </tr>
            <{foreach item=element from=$image_form.elements}>
                <{if $element.hidden != true && $element.body != ''}>
                    <tr>
                        <td class="odd aligntop">
                            <div class="spacer bold"><{$element.caption}><{if $element.required}><span class="red">&nbsp;*</span><{/if}></div>
                            <div class="spacer"><{$element.description}></div>
                        </td>
                        <td class="even"><{$element.body}></td>
                    </tr>
                <{else}>
                    <{$element.body}>
                <{/if}>
            <{/foreach}>
        </table>
    </form>
</div>
<!-- Add Category form -->
<div id="xo-category-add" class="hide">
    <br>
    <{$imagecat_form.javascript}>
    <form name="<{$imagecat_form.name}>" id="<{$imagecat_form.name}>" action="<{$imagecat_form.action}>" method="<{$imagecat_form.method}>"
            <{$imagecat_form.extra}> >
        <table class="outer">
            <tr>
                <th colspan="2"><{$imagecat_form.title}></th>
            </tr>
            <{foreach item=element from=$imagecat_form.elements}>
                <{if $element.hidden != true && $element.body != ''}>
                    <tr>
                        <td class="odd aligntop">
                            <div class="spacer bold"><{$element.caption}><{if $element.required}><span class="red">&nbsp;*</span><{/if}></div>
                            <div class="spacer"><{$element.description}></div>
                        </td>
                        <td class="even"><{$element.body}></td>
                    </tr>
                <{else}>
                    <{$element.body}>
                <{/if}>
            <{/foreach}>
        </table>
    </form>
</div>
<!-- Edit form image -->
<{if $edit_form}>
    <div id="xo-images-add" class="">
        <{$edit_thumbs}>
        <br>
        <{$edit_form.javascript}>
        <form name="<{$edit_form.name}>" id="<{$edit_form.name}>" action="<{$edit_form.action}>" method="<{$edit_form.method}>"
                <{$edit_form.extra}> >
            <table class="outer">
                <tr>
                    <th colspan="2"><{$edit_form.title}></th>
                </tr>
                <{foreach item=element from=$edit_form.elements}>
                    <{if $element.hidden != true && $element.body != ''}>
                        <tr>
                            <td class="odd aligntop">
                                <div class="spacer bold"><{$element.caption}><{if $element.required}><span class="red">&nbsp;*</span><{/if}></div>
                                <div class="spacer"><{$element.description}></div>
                            </td>
                            <td class="even"><{$element.body}></td>
                        </tr>
                    <{else}>
                        <{$element.body}>
                    <{/if}>
                <{/foreach}>
            </table>
        </form>
    </div>
<{/if}>
<script type="text/javascript">
    IMG_ON = '<{xoAdminIcons success.png}>';
    IMG_OFF = '<{xoAdminIcons cancel.png}>';

    $('.lightbox').lightBox({
        imageLoading: 'language/<{$xoops_language}>/images/lightbox-ico-loading.gif',
        imageBtnClose: 'language/<{$xoops_language}>/images/lightbox-btn-close.gif',
        imageBtnNext: 'language/<{$xoops_language}>/images/lightbox-btn-next.gif',
        imageBtnPrev: 'language/<{$xoops_language}>/images/lightbox-btn-prev.gif',
        imageBlank: 'language/<{$xoops_language}>/images/lightbox-blank.gif'
    });


</script>
