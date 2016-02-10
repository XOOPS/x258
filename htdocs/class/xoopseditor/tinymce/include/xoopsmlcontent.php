<?php
/**
 *  TinyMCE adapter for XOOPS
 *
 * @copyright       (c) 2000-2015 XOOPS Project (www.xoops.org)
 * @license             GNU GPL 2 or later (http://www.gnu.org/licenses/gpl-2.0.html)
 * @package             class
 * @subpackage          editor
 * @since               2.3.0
 * @author              Laurent JEN <dugris@frxoops.org>
 * @version             $Id: xoopsmlcontent.php 13082 2015-06-06 21:59:41Z beckmi $
 */

defined('XOOPS_ROOT_PATH') || exit('XOOPS root path not defined');

// Xlanguage
if ($GLOBALS["module_handler"]->getByDirname("xlanguage") && defined("XLANGUAGE_LANG_TAG")) {
    return true;
}

// Easiest Multi-Language Hack (EMLH)
if (defined('EASIESTML_LANGS') && defined('EASIESTML_LANGNAMES')) {
    return true;
}

return false;
