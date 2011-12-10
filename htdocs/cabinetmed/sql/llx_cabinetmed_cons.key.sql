-- ===================================================================
-- Copyright (C) 2005 Laurent Destailleur  <eldy@users.sourceforge.net>
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
--
-- $Id: llx_cabinetmed_cons.key.sql,v 1.2 2011/03/26 18:28:24 eldy Exp $
-- ===================================================================


-- Supprimme orhpelins pour permettre montee de la cle

ALTER TABLE llx_cabinetmed_cons ADD INDEX idx_cabinetmed_cons_fk_soc(fk_soc);
ALTER TABLE llx_cabinetmed_cons ADD CONSTRAINT fk_cabinetmed_cons_fk_soc FOREIGN KEY (fk_soc) REFERENCES llx_societe(rowid);

ALTER TABLE llx_cabinetmed_cons ADD INDEX idx_cabinetmed_cons_datecons(datecons);
