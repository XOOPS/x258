<div id="xo-system-block-login" class="center">
    <form action="<{xoAppUrl user.php op=login}>" method="post">
        <label><{$block.lang_username}></label>
        <br>
        <input type="text" name="uname" size="12" value="<{$block.unamevalue}>" maxlength="25"/><br>
        <label><{$block.lang_password}></label>
        <br>
        <input type="password" name="pass" size="12" maxlength="32"/>
        <br>
        <{if isset($block.lang_rememberme)}>
            <input type="checkbox" name="rememberme" value="On" class="formButton"/>
            <{$block.lang_rememberme}>
            <br>
        <{/if}>
        <input type="hidden" name="xoops_redirect" value="<{$xoops_requesturi}>"/>
        <input type="hidden" name="op" value="login"/>
        <input class="xo-formbuttons" type="submit" value="<{$block.lang_login}>"/>
        <br>
        <{$block.sslloginlink}>
    </form>
    <a href="<{xoAppUrl user.php#lost}>"><{$block.lang_lostpass}></a>
    <br>
    <a href="<{xoAppUrl register.php}>"><{$block.lang_registernow}></a>
</div>
