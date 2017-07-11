<?php
/* Copyright (C) 2008-2012 Laurent Destailleur  <eldy@users.sourceforge.net>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 * or see http://www.gnu.org/
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

/**
 *	\file       htdocs/thomsonphonebook/admin/thomsonphonebook.php
 *  \ingroup    thomsonphonebook
 *	\brief      Page to setup module thomsonphonebook
 *				You configure your phones to call URL
 *				http://mydolibarr/thomsonphonebook/thomsonphonebook.php?search=#SEARCH
 */

// Load Dolibarr environment
$res=0;
// Try main.inc.php into web root known defined into CONTEXT_DOCUMENT_ROOT (not always defined)
if (! $res && ! empty($_SERVER["CONTEXT_DOCUMENT_ROOT"])) $res=@include($_SERVER["CONTEXT_DOCUMENT_ROOT"]."/main.inc.php");
// Try main.inc.php into web root detected using web root caluclated from SCRIPT_FILENAME
$tmp=empty($_SERVER['SCRIPT_FILENAME'])?'':$_SERVER['SCRIPT_FILENAME'];$tmp2=realpath(__FILE__); $i=strlen($tmp)-1; $j=strlen($tmp2)-1;
while($i > 0 && $j > 0 && isset($tmp[$i]) && isset($tmp2[$j]) && $tmp[$i]==$tmp2[$j]) { $i--; $j--; }
if (! $res && $i > 0 && file_exists(substr($tmp, 0, ($i+1))."/main.inc.php")) $res=@include(substr($tmp, 0, ($i+1))."/main.inc.php");
if (! $res && $i > 0 && file_exists(dirname(substr($tmp, 0, ($i+1)))."/main.inc.php")) $res=@include(dirname(substr($tmp, 0, ($i+1)))."/main.inc.php");
// Try main.inc.php using relative path
if (! $res && file_exists("../../main.inc.php")) $res=@include("../../main.inc.php");
if (! $res && file_exists("../../../main.inc.php")) $res=@include("../../../main.inc.php");
if (! $res) die("Include of main fails");


/*
 * View
 */

$help_url='EN:Module_ThomsonPhoneBook_EN|FR:Module_ThomsonPhoneBook|ES:M&oacute;dulo_ThomsonPhoneBook';

llxHeader('','',$help_url);

if (empty($conf->thomsonphonebook->enabled))
{
	dol_print_error($db,'Module was not enabled');
    exit;
}

print "Module is enabled. To use it, you must setup your phone to call following URL:<br><br>\n";
$url=dol_buildpath('/thomsonphonebook/thomsonphonebook.php',1);
$url=DOL_MAIN_URL_ROOT.(preg_replace('/'.preg_quote(DOL_URL_ROOT,'/').'/', '', $url)).'?search=#SEARCH';
print '<a href="'.$url.'">'.$url."<br>\n";


llxFooter();

$db->close();
