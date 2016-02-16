<?php
/* Copyright (C) 2011 Laurent Destailleur  <eldy@users.sourceforge.net>
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
 */

/**
 *	\file       htdocs/cabinetmed/class/actions_cabinetmed.class.php
 *	\ingroup    cabinetmed
 *	\brief      File to control actions
 */
require_once(DOL_DOCUMENT_ROOT."/core/class/commonobject.class.php");


/**
 *	Class to manage hooks for module Google
 */
class ActionsGoogle
{
    var $db;
    var $error;
    var $errors=array();

    /**
	 *	Constructor
	 *
	 *  @param		DoliDB		$db      Database handler
     */
    function __construct($db)
    {
        $this->db = $db;
    }



    /**
     * addCalendarChoice
     *
     * @param	array		$parameters		Array of parameters
     * @param	Object		$object			Object
     * @param	string		$action			Action string
     * @param	HookManager	$hookmanager	Object HookManager
     * @return	int							0=OK
     */
    function addCalendarChoice($parameters, &$object, &$action, $hookmanager)
    {
    	global $conf, $langs, $user;
        global $form;
        
    	$error = 0;

    	if ($conf->google->enabled)
    	{
    		if (! empty($conf->global->GOOGLE_DUPLICATE_INTO_GCAL))
    		{
				// Define $max, $maxgoogle and $notolderforsync
				$max=(empty($conf->global->GOOGLE_MAX_FOR_MASS_AGENDA_SYNC)?50:$conf->global->GOOGLE_MAX_FOR_MASS_AGENDA_SYNC);
				$maxgoogle=2500;
				$notolderforsync=(empty($conf->global->GOOGLE_MAXOLDDAYS_FOR_MASS_AGENDA_SYNC)?20:$conf->global->GOOGLE_MAXOLDDAYS_FOR_MASS_AGENDA_SYNC);   // nb days max
				$testoffset=3600;

    			$fuser = $user;
                $now = dol_now();
                
    			$userlogin = empty($conf->global->GOOGLE_LOGIN)?'':$conf->global->GOOGLE_LOGIN;
	    		if (empty($userlogin)) $userlogin = empty($fuser->conf->GOOGLE_LOGIN)?'':$fuser->conf->GOOGLE_LOGIN;

				$keyparam='GOOGLE_AGENDA_LASTSYNC_'.$userlogin;
				$valparam=$conf->global->$keyparam;
				if ($valparam) $dateminsync=dol_stringtotime($valparam, 1);
				if (empty($dateminsync) || $dateminsync < ($now - ($notolderforsync * 24 * 3600))) $dateminsync=($now - ($notolderforsync * 24 * 3600));

	    		$actiongoogle = GETPOST('actiongoogle');

	    		$_SERVER['QUERY_STRING'] = preg_replace('/&*actiongoogle=refresh/','',$_SERVER['QUERY_STRING']);


	    		// Action sync
	    		if ($actiongoogle == 'refresh')
	    		{
					dol_include_once("/google/lib/google.lib.php");
					dol_include_once('/google/lib/google_calendar.lib.php');

					if (! $error)
					{
						$dateminsync = strtotime('-1 day',$dateminsync);
						$resarray = syncEventsFromGoogleCalendar($userlogin, $user, $dateminsync, $max);

						$errors=$resarray['errors'];
						$nbinserted=$resarray['nbinserted'];
						$nbupdated=$resarray['nbupdated'];
						$nbdeleted=$resarray['nbdeleted'];
						$nbalreadydeleted=$resarray['nbalreadydeleted'];

						if (! empty($errors))
						{
							setEventMessage($errors, 'errors');
						}
						else
						{
							setEventMessage($langs->trans("GetFromGoogleSucess", $nbinserted, $nbupdated, $nbdeleted), 'mesgs');
							if ($nbalreadydeleted) setEventMessage($langs->trans("GetFromGoogleAlreadyDeleted", $nbalreadydeleted), 'mesgs');

							include_once DOL_DOCUMENT_ROOT.'/core/lib/admin.lib.php';
							dolibarr_set_const($this->db,$keyparam,dol_print_date(dol_now('gmt'), 'dayhourrfc', 'gmt'),'chaine',1,'',$conf->entity);
							$valparam=$conf->global->$keyparam;
							$dateminsync=dol_stringtotime($valparam, 1);
							//var_dump($keyparam);exit;
						}
					}
	    		}



	    		// HTML output to show into agenda views
	    		$this->resprints = '<div class="clearboth"></div><div class="googlerefreshcal">';
	    		$this->resprints.= '<a href="'.$_SERVER["PHP_SELF"].'?'.$_SERVER['QUERY_STRING'].'&actiongoogle=refresh">';
	    		$this->resprints.= $langs->trans("ClickToUpdateWithLastGoogleChanges", $userlogin);
	    		$this->resprints.= ' '.dol_print_date($dateminsync, 'dayhour');
	    		$this->resprints.= $form->textwithtooltip(img_help(),$langs->trans("GoogleLimitBackTime",$notolderforsync));
	    		$this->resprints.= '</a></div>';

    		}
    	}

    	return 0;
    }

}
