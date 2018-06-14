
-- Insert payment modes
INSERT INTO llx_c_paiement (id,code,libelle,type,active,accountancy_code,module) VALUES (100,'STRIPE','Stripe',2,1,null,null);
INSERT INTO llx_c_paiement (id,code,libelle,type,active,accountancy_code,module) VALUES (101,'PAYPAL','Paypal',2,1,null,null);


-- Insert package/products
--DELETE FROM llx_product where rowid >= 100;
--INSERT INTO llx_product (rowid,fk_product_type,ref,label,price,tosell,tobuy, duration) VALUES (100, 1, 'DOLICLOUD-PACK-Dolibarr', 'Instance Dolibarr ERP & CRM',   0, 1, 1, '1m');
--INSERT INTO llx_product (rowid,fk_product_type,ref,label,price,tosell,tobuy, duration) VALUES (130, 1, 'DOLICLOUD-OPT-Go',        'Option Gb over 5Gb',            1, 1, 1, '1m');
--INSERT INTO llx_product (rowid,fk_product_type,ref,label,price,tosell,tobuy, duration) VALUES (151, 1, 'DOLICLOUD-MOD-DoliMed',   'Module DoliMed',                0, 1, 1, '1m');
--INSERT INTO llx_product (rowid,fk_product_type,ref,label,price,tosell,tobuy, duration) VALUES (152, 1, 'DOLICLOUD-MOD-Google',    'Module Google',                 8, 1, 1, '1m');
-- ...



-- Plans may be Variant of package/products



-- Insert emails templates

DELETE FROM llx_c_email_templates where label in ('InstanceDeployed','InstanceUndeployed','GentleTrialExpiringReminder','InvoicePaymentSuccess','InvoicePaymentFailure','AlertCreditCardExpiration','AlertPaypalApprovalExpiration','PasswordAssistance','ChannelPartnerCreated','CustomerAccountSuspendedTrial','CustomerAccountSuspended','CustomerInstanceUpdated','CustomerInstanceUgraded','CustomerInstanceUpgraded');
DELETE FROM llx_c_email_templates where label in ('(InstanceDeployed)','(InstanceUndeployed)','(GentleTrialExpiringReminder)','(InvoicePaymentSuccess)','(InvoicePaymentFailure)','(AlertCreditCardExpiration)','(AlertPaypalApprovalExpiration)','(PasswordAssistance)','(ChannelPartnerCreated)','(CustomerAccountSuspendedTrial)','(CustomerAccountSuspended)','(CustomerInstanceUpdated)','(CustomerInstanceUgraded)','(CustomerInstanceUpgraded)');
INSERT INTO llx_c_email_templates (module,type_template,label,lang,topic,joinfiles,content) VALUES ('sellyoursaas', 'contract',                        'InstanceDeployed',                NULL,'Welcome to __[SELLYOURSAAS_NAME]__ - Your instance __REFCLIENT__ is ready',   0, '<body>\n <p>Dear __[SELLYOURSAAS_NAME]__ user,<br><br>\nWe are delighted to welcome you as a user of __[SELLYOURSAAS_NAME]__, the Ondemand service of your ERP & CRM.\n                <br>\n                   Your __PACKAGELABEL__ is installed, setup and ready for you.\n                   Here are the details you need to get started:\n               \n                <br /><br /><strong>Your __PACKAGELABEL__ :</strong>\n                <ul>\n                    <li>URL: <a href="https://__REFCLIENT__?username=__APPUSERNAME__">https://__REFCLIENT__</a></li>\n                    <li>Login: __APPUSERNAME__</li>\n                    <li>Password: __APPPASSWORD__</li>\n                </ul>\n                <br /><strong>Your customer dashboard :</strong>\n                <ul>\n                    <li>URL: <a href="__[SELLYOURSAAS_ACCOUNT_URL]__?username=__THIRDPARTY_EMAIL__">__[SELLYOURSAAS_ACCOUNT_URL]__</a></li>\n                    <li>Login: __THIRDPARTY_EMAIL__</li>\n                    <li>Password: __APPPASSWORD__</li>\n                </ul>                \n            \n            <br /></p>\n            Sincerly, <br />\n            The __[SELLYOURSAAS_NAME]__ Team <br />\n            ----------------------------------------- <br />\n            EMail: __[SELLYOURSAAS_MAIN_EMAIL]__<br />\n</body>\n            ');
INSERT INTO llx_c_email_templates (module,type_template,label,lang,topic,joinfiles,content) VALUES ('sellyoursaas', 'contract',                        'InstanceUndeployed',              NULL,'[__[SELLYOURSAAS_NAME]__] - Destruction of your instance __REFCLIENT__',   0, '<body>\n <p>Dear __[SELLYOURSAAS_NAME]__ user,<br><br>\nYou made a request on __[SELLYOURSAAS_NAME]__, the Ondemand service of your ERP & CRM to delete your instance <b>__REFCLIENT__</b>.\n                <br>\n                    Your instance was suspended and your data will be destroyed in few days. For an immediate deletion, please click on this link:<br><a href="__[SELLYOURSAAS_ACCOUNT_URL]__?contractid=__ID__&action=undeployconfirmed&hash=__HASH__">I confirm deletion of __REFCLIENT__</a>               \n            \n            <br /></p>\n            Sincerly, <br />\n            The __[SELLYOURSAAS_NAME]__ Team <br />\n            ----------------------------------------- <br />\n            EMail: __[SELLYOURSAAS_MAIN_EMAIL]__<br />\n</body>\n            ');
INSERT INTO llx_c_email_templates (module,type_template,label,lang,topic,joinfiles,content) VALUES ('sellyoursaas', 'contract',                        'GentleTrialExpiringReminder',     NULL,'[__[SELLYOURSAAS_NAME]__] - Your Trial will soon expire',                     0, '<body>\n <p>Dear __[SELLYOURSAAS_NAME]__ user,<br><br>\nJust a quick reminder that trial of your instance __REFCLIENT__ will expire soon (__SELLYOURSAAS_EXPIRY_DATE__). If you wish to continue using this service, please login to your customer console to add a payment method (Credit or Paypal accepted).\n          </p>\n          <p>\nFor this, click here to go on your customer dashboard: <a href="__[SELLYOURSAAS_ACCOUNT_URL]__">__[SELLYOURSAAS_ACCOUNT_URL]__</a><br />\nRemind: Your customer dashboard login is <strong>__THIRDPARTY_EMAIL__</strong><br /><br />\nYou If you have entered this information recently, thank you to ignore this email.<br />\n</p>\n          <br />\n            Sincerly, <br />\n            The __[SELLYOURSAAS_NAME]__ Team <br />\n            ----------------------------------------- <br />\n            EMail: __[SELLYOURSAAS_MAIN_EMAIL]__<br />\n</body>\n       ');
INSERT INTO llx_c_email_templates (module,type_template,label,lang,topic,joinfiles,content) VALUES ('sellyoursaas', 'thirdparty',                      '(AlertCreditCardExpiration)',     NULL,'[__[SELLYOURSAAS_NAME]__] - Urgent: Your credit card is expiring',            0, '<body>\n <p>Dear __[SELLYOURSAAS_NAME]__ user,<br><br>\nWe wish to inform you that your payment method (Credit card ....__CARD_LAST4__) will soon expire.<br />\n              \n              Please login to your <a href="__[SELLYOURSAAS_ACCOUNT_URL]__?username=__THIRDPARTY_EMAIL__">__[SELLYOURSAAS_NAME]__ dashboard</a> to update your credit card information as soon as possible to prevent any interuptions in service.<br />\nRemind: Your DoliCloud dashboard login is <strong>__THIRDPARTY_EMAIL__</strong><br />\n            </p>\n            <p>If you have any questions relating to the above please do not hesitate get in touch.</p>\n<br />\n\n            Sincerly, <br />\n            The __[SELLYOURSAAS_NAME]__ Team <br />\n            ----------------------------------------- <br />\n            EMail: __[SELLYOURSAAS_MAIN_EMAIL]__<br />\n</body>\n        ');
INSERT INTO llx_c_email_templates (module,type_template,label,lang,topic,joinfiles,content) VALUES ('sellyoursaas', 'thirdparty',                      '(AlertPaypalApprovalExpiration)', NULL,'[__[SELLYOURSAAS_NAME]__] - Urgent: Your Paypal approval is expiring',        0, '<body>\n <p>Dear __[SELLYOURSAAS_NAME]__ user,<br><br>\nWe wish to inform you that your Paypal payment approval will soon expire (__PAYPAL_EXP_DATE__).<br />\n              \n              Please login to your <a href="__[SELLYOURSAAS_ACCOUNT_URL]__?username=__THIRDPARTY_EMAIL__">__[SELLYOURSAAS_NAME]__ dashboard</a> to renew your Paypal approval as soon as possible to prevent any interuptions in service.<br />\nRemind: Your DoliCloud dashboard login is <strong>__THIRDPARTY_EMAIL__</strong><br />\n            </p>\n            <p>If you have any questions relating to the above please do not hesitate get in touch.</p>\n<br />\n\n            Sincerly, <br />\n            The __[SELLYOURSAAS_NAME]__ Team <br />\n            ----------------------------------------- <br />\n            EMail: __[SELLYOURSAAS_MAIN_EMAIL]__<br />\n</body>\n        ');
INSERT INTO llx_c_email_templates (module,type_template,label,lang,topic,joinfiles,content) VALUES ('sellyoursaas', 'thirdparty',                      '(PasswordAssistance)',            NULL,'[__[SELLYOURSAAS_NAME]__] - __(SubjectNewPasswordForYouCustomerDashboard)__', 0, '<body>\n <p>\n__(Hello)__,<br><br>\n__(RequestToResetPasswordReceived)__<br><br>__(YouMustClickToChange)__<br><br><a href="__URL_TO_RESET__">__URL_TO_RESET__</a><br><br>__(ApplicantIpAddress)__: __USER_REMOTE_IP__<br>__(ForgetIfNothing)__<br><br><p>\n__(Sincerly)__,<br><br>\n----------------------------------------- <br>The __[SELLYOURSAAS_NAME]__ Team<br>\nEMail: __[SELLYOURSAAS_MAIN_EMAIL]__<br>\n</body>');
INSERT INTO llx_c_email_templates (module,type_template,label,lang,topic,joinfiles,content) VALUES ('sellyoursaas', 'thirdparty',                      '(ChannelPartnerCreated)',         NULL,'[__[SELLYOURSAAS_NAME]__] - Channel Partner Created',                         0, '<body>\n <p>Dear __[SELLYOURSAAS_NAME]__ partner,<br><br>\nWe are delighted to welcome you as a Channel Partner of __[SELLYOURSAAS_NAME]__.\n          </p>\n          <p>\n             Your account has been setup for you. Features for reselling __[SELLYOURSAAS_NAME]__ are now available in the same dashboard that your customer dashboard, so:\n          </p>\n          <ul>\n              <li>Login link: <a href="__[SELLYOURSAAS_ACCOUNT_URL]__">__[SELLYOURSAAS_ACCOUNT_URL]__</a></li>\n              <li>Username: <strong>__THIRDPARTY_EMAIL__</strong></li>\n          </ul>                \n          <p>\n              Sincerly, <br />\n              The __[SELLYOURSAAS_NAME]__ Team <br />\n            ----------------------------------------- <br />\n            EMail: __[SELLYOURSAAS_MAIN_EMAIL]__<br />\n</body>\n        ');
INSERT INTO llx_c_email_templates (module,type_template,label,lang,topic,joinfiles,content) VALUES ('sellyoursaas', 'facture_send',                    'InvoicePaymentSuccess',           NULL,'[__[SELLYOURSAAS_NAME]__] - Invoice Payment Success __REF__',                 0, '<body>\n <p>Dear __[SELLYOURSAAS_NAME]__ user,<br><br>\nThis email confirms successful payment from your <strong>__[SELLYOURSAAS_NAME]__</strong> account, your Ondemand service of OpenSource software. You can also login to your <a href="__[SELLYOURSAAS_ACCOUNT_URL]__?username=__THIRDPARTY_EMAIL__">__[SELLYOURSAAS_NAME]__ dashboard</a> to download your PDF invoices at any time.<br />\nRemind: Your DoliCloud dashboard login is <strong>__THIRDPARTY_EMAIL__</strong><br />\n            </p>\n            <p>If you have any questions relating to the above please do not hesitate get in touch.</p>\n<br />\n\n            Sincerly, <br />\n            The __[SELLYOURSAAS_NAME]__ Team <br />\n            ----------------------------------------- <br />\n            EMail: __[SELLYOURSAAS_MAIN_EMAIL]__<br />\n</body>\n        ');
INSERT INTO llx_c_email_templates (module,type_template,label,lang,topic,joinfiles,content) VALUES ('sellyoursaas', 'facture_send',                    'InvoicePaymentFailure',           NULL,'[__[SELLYOURSAAS_NAME]__] - Invoice Payment Failure __REF__',                 0, '<body>\n <p>Dear __[SELLYOURSAAS_NAME]__ user,<br><br>\nAn attempt to take payment for invoice __REF__ has failed. Please update your payment method, or contact your bank or payment method provider.<br />\n                Should failure to take this payment continue, access to our service will be discontinued, and any data you have with us maybe lost.<br />\n<br />\nPlease login to your <a href="__[SELLYOURSAAS_ACCOUNT_URL]__">__[SELLYOURSAAS_NAME]__ dashboard</a> to update and fix your credit card or paypal information as soon as possible to prevent any interuptions in service.<br />\nRemind: Your __[SELLYOURSAAS_NAME]__ dashboard login is <strong>__THIRDPARTY_EMAIL__</strong><br />\n              </p>\n              <p>\n                The error we received from your bank was: <br />\n                __SELLYOURSAAS_PAYMENT_ERROR_DESC__\n              </p><br />\n\n            Sincerly, <br />\n            The __[SELLYOURSAAS_NAME]__ Team <br />\n            ----------------------------------------- <br />\n            EMail: __[SELLYOURSAAS_MAIN_EMAIL]__<br />\n</body>\n          ');
INSERT INTO llx_c_email_templates (module,type_template,label,lang,topic,joinfiles,content) VALUES ('sellyoursaas', 'contract',                        'CustomerAccountSuspendedTrial',   NULL,'[__[SELLYOURSAAS_NAME]__] - Account Suspension of __REFCLIENT__ after end of trial', 0, '<body>\n <p>Dear __[SELLYOURSAAS_NAME]__ user,<br><br>\nWe wish to inform you that your instance __REFCLIENT__ has been suspended. This is likely due to the end of your trial period. If you wish to continue using your application, please login to your <a href="__[SELLYOURSAAS_ACCOUNT_URL]__">__[SELLYOURSAAS_NAME]__ dashboard</a> to enter a payment mode. Your instance access will be restored. If you don''t want to engage with us, just ignore this email and your instance and your data will we deleted in few days.</p><br />\n Sincerly, <br /> \n               The __[SELLYOURSAAS_NAME]__ Team <br />\n            ----------------------------------------- <br />\n            EMail: __[SELLYOURSAAS_MAIN_EMAIL]__<br />\n</body>\n       ');
INSERT INTO llx_c_email_templates (module,type_template,label,lang,topic,joinfiles,content) VALUES ('sellyoursaas', 'contract',                        'CustomerAccountSuspended',        NULL,'[__[SELLYOURSAAS_NAME]__] - Account Suspension of __REFCLIENT__',                    0, '<body>\n <p>Dear __[SELLYOURSAAS_NAME]__ user,<br><br>\nWe wish to inform you that your instance __REFCLIENT__ has been suspended. This is likely due to a payment problem.  If you wish to continue using your application, please login to your <a href="__[SELLYOURSAAS_ACCOUNT_URL]__">__[SELLYOURSAAS_NAME]__ dashboard</a> to fix your payment mode. Your instance access will be restored. If you don''t want to continue with us, just ignore this email and following reminders, and your instance and your data will we deleted in few weeks.</p><br />\n Sincerly, <br /> \n               The __[SELLYOURSAAS_NAME]__ Team <br />\n            ----------------------------------------- <br />\n            EMail: __[SELLYOURSAAS_MAIN_EMAIL]__<br />\n</body>\n       ');
INSERT INTO llx_c_email_templates (module,type_template,label,lang,topic,joinfiles,content) VALUES ('sellyoursaas', 'contract',                        'CustomerInstanceUpgraded',         NULL,'[__[SELLYOURSAAS_NAME]__] - Upgrade of instance __REFCLIENT__',                                0, '<body>\n <p>Dear __[SELLYOURSAAS_NAME]__ user,<br><br>\nWe wish to inform you your instance has been upgraded to last stable version. If you experience problem after this upgrade, you can contact us at __[SELLYOURSAAS_MAIN_EMAIL]__ </p><br />\n Sincerly, <br /> \n               The __[SELLYOURSAAS_NAME]__ Team <br />\n            ----------------------------------------- <br />\n            EMail: __[SELLYOURSAAS_MAIN_EMAIL]__<br />\n</body>\n       ');
INSERT INTO llx_c_email_templates (module,type_template,label,lang,topic,joinfiles,content) VALUES ('sellyoursaas', 'contract',                        'InstanceDeployed',                'fr_FR','Bienvenu sur __[SELLYOURSAAS_NAME]__ - Votre instance __REFCLIENT__ est prête',   0, '<body>\n <p>Cher utilisateur/utilisatrice __[SELLYOURSAAS_NAME]__,<br><br>\nNous sommes heureux de vous accueillir comme utilisateur de __[SELLYOURSAAS_NAME]__, le service à la demande de votre ERP & CRM.\n                <br>\n                   Votre __PACKAGELABEL__ est installé, configuré et prêt pour vous.\n                   Voici les détails à connaitre pour démarrer:\n               \n                <br /><br /><strong>Votre __PACKAGELABEL__ :</strong>\n                <ul>\n                    <li>URL: <a href="https://__REFCLIENT__?username=__APPUSERNAME__">https://__REFCLIENT__</a></li>\n                    <li>Login: __APPUSERNAME__</li>\n                    <li>Mot de passe: __APPPASSWORD__</li>\n                </ul>\n                <br /><strong>Votre espace client :</strong>\n                <ul>\n                    <li>URL: <a href="__[SELLYOURSAAS_ACCOUNT_URL]__?username=__THIRDPARTY_EMAIL__">__[SELLYOURSAAS_ACCOUNT_URL]__</a></li>\n                    <li>Login: __THIRDPARTY_EMAIL__</li>\n                    <li>Mot de passe: __APPPASSWORD__</li>\n                </ul>                \n            \n            <br /></p>\n            Cordialement, <br />\n            L''équipe __[SELLYOURSAAS_NAME]__<br />\n            ----------------------------------------- <br />\n            EMail: __[SELLYOURSAAS_MAIN_EMAIL]__<br />\n</body>\n            ');
INSERT INTO llx_c_email_templates (module,type_template,label,lang,topic,joinfiles,content) VALUES ('sellyoursaas', 'contract',                        'InstanceUndeployed',              'fr_FR','[__[SELLYOURSAAS_NAME]__] - Destruction de votre instance __REFCLIENT__',   0, '<body>\n <p>Cher utilisateur/utilisatrice __[SELLYOURSAAS_NAME]__,<br><br>\nVous avez réaliser une demande sur __[SELLYOURSAAS_NAME]__, le service à la demande de votre ERP & CRM, afin de détruire votre instance <b>__REFCLIENT__</b>.\n                <br>\n                    Votre instance a déjà été suspendue et vos données seront détruite dans quelques jours. Pour une destruction immédiate, cliquez le lien suivant:<br><a href="__[SELLYOURSAAS_ACCOUNT_URL]__?contractid=__ID__&action=undeployconfirmed&hash=__HASH__">Je confirme la destruction de __REFCLIENT__</a>               \n            \n            <br /></p>\n            Cordialement, <br />\n            L''équipe __[SELLYOURSAAS_NAME]__<br />\n            ----------------------------------------- <br />\n            EMail: __[SELLYOURSAAS_MAIN_EMAIL]__<br />\n</body>\n            ');
INSERT INTO llx_c_email_templates (module,type_template,label,lang,topic,joinfiles,content) VALUES ('sellyoursaas', 'contract',                        'GentleTrialExpiringReminder',     'fr_FR','[__[SELLYOURSAAS_NAME]__] - Votre période d''essai expire bientôt',         0, '<body>\n <p>Cher utilisateur/utilisatrice __[SELLYOURSAAS_NAME]__,<br><br>\nJust a quick reminder that trial of your instance __REFCLIENT__ will expire soon (__SELLYOURSAAS_EXPIRY_DATE__). If you wish to continue using this service, please login to your customer console to add a payment method (Credit or Paypal accepted).\n          </p>\n          <p>\nFor this, click here to go on your customer dashboard: <a href="__[SELLYOURSAAS_ACCOUNT_URL]__">__[SELLYOURSAAS_ACCOUNT_URL]__</a><br />\nRemind: Your customer dashboard login is <strong>__THIRDPARTY_EMAIL__</strong><br /><br />\nYou If you have entered this information recently, thank you to ignore this email.<br />\n</p>\n          <br />\n            Cordialement, <br />\n            L''équipe __[SELLYOURSAAS_NAME]__<br />\n            ----------------------------------------- <br />\n            EMail: __[SELLYOURSAAS_MAIN_EMAIL]__<br />\n</body>\n       ');
INSERT INTO llx_c_email_templates (module,type_template,label,lang,topic,joinfiles,content) VALUES ('sellyoursaas', 'facture_send',                    'InvoicePaymentSuccess',           'fr_FR','[__[SELLYOURSAAS_NAME]__] - Paiement réussi de la facture __REF__',        0, '<body>\n <p>Cher utilisateur/utilisatrice __[SELLYOURSAAS_NAME]__,<br><br>\nThis email confirms successful payment from your <strong>__[SELLYOURSAAS_NAME]__</strong> account, your Ondemand service of OpenSource software. You can also login to your <a href="__[SELLYOURSAAS_ACCOUNT_URL]__?username=__THIRDPARTY_EMAIL__">__[SELLYOURSAAS_NAME]__ dashboard</a> to download your PDF invoices at any time.<br />\nRemind: Your DoliCloud dashboard login is <strong>__THIRDPARTY_EMAIL__</strong><br />\n            </p>\n            <p>If you have any questions relating to the above please do not hesitate get in touch.</p>\n<br />\n\n            Cordialement, <br />\n            L''équipe __[SELLYOURSAAS_NAME]__<br />\n            ----------------------------------------- <br />\n            EMail: __[SELLYOURSAAS_MAIN_EMAIL]__<br />\n</body>\n        ');
INSERT INTO llx_c_email_templates (module,type_template,label,lang,topic,joinfiles,content) VALUES ('sellyoursaas', 'facture_send',                    'InvoicePaymentFailure',           'fr_FR','[__[SELLYOURSAAS_NAME]__] - Paiement en échec de la facture __REF__',      0, '<body>\n <p>Cher utilisateur/utilisatrice __[SELLYOURSAAS_NAME]__,<br><br>\nAn attempt to take payment for invoice __REF__ has failed. Please update your payment method, or contact your bank or payment method provider.<br />\n                Should failure to take this payment continue, access to our service will be discontinued, and any data you have with us maybe lost.<br />\n<br />\nPlease login to your <a href="__[SELLYOURSAAS_ACCOUNT_URL]__">__[SELLYOURSAAS_NAME]__ dashboard</a> to update and fix your credit card or paypal information as soon as possible to prevent any interuptions in service.<br />\nRemind: Your __[SELLYOURSAAS_NAME]__ dashboard login is <strong>__THIRDPARTY_EMAIL__</strong><br />\n              </p>\n              <p>\n                The error we received from your bank was: <br />\n                __SELLYOURSAAS_PAYMENT_ERROR_DESC__\n              </p><br />\n\n            Cordialement, <br />\n            L''équipe __[SELLYOURSAAS_NAME]__<br />\n            ----------------------------------------- <br />\n            EMail: __[SELLYOURSAAS_MAIN_EMAIL]__<br />\n</body>\n          ');
INSERT INTO llx_c_email_templates (module,type_template,label,lang,topic,joinfiles,content) VALUES ('sellyoursaas', 'contract',                        'CustomerAccountSuspendedTrial',   'fr_FR','[__[SELLYOURSAAS_NAME]__] - Suspension de l''instance __REFCLIENT__ après fin de période d''essai', 0, '<body>\n <p>Cher utilisateur/utilisatrice __[SELLYOURSAAS_NAME]__,<br><br>\nWe wish to inform you that your instance __REFCLIENT__ has been suspended. This is likely due to the end of your trial period. If you wish to continue using your application, please login to your <a href="__[SELLYOURSAAS_ACCOUNT_URL]__">__[SELLYOURSAAS_NAME]__ dashboard</a> to enter a payment mode. Your instance access will be restored. If you don''t want to engage with us, just ignore this email and your instance and your data will we deleted in few days.</p><br />\n Cordialement, <br />\n            L''équipe __[SELLYOURSAAS_NAME]__<br />\n            ----------------------------------------- <br />\n            EMail: __[SELLYOURSAAS_MAIN_EMAIL]__<br />\n</body>\n       ');
INSERT INTO llx_c_email_templates (module,type_template,label,lang,topic,joinfiles,content) VALUES ('sellyoursaas', 'contract',                        'CustomerAccountSuspended',        'fr_FR','[__[SELLYOURSAAS_NAME]__] - Suspension de l''instance __REFCLIENT__',    0, '<body>\n <p>Cher utilisateur/utilisatrice __[SELLYOURSAAS_NAME]__,<br><br>\nWe wish to inform you that your instance __REFCLIENT__ has been suspended. This is likely due to a payment problem.  If you wish to continue using your application, please login to your <a href="__[SELLYOURSAAS_ACCOUNT_URL]__">__[SELLYOURSAAS_NAME]__ dashboard</a> to fix your payment mode. Your instance access will be restored. If you don''t want to continue with us, just ignore this email and following reminders, and your instance and your data will we deleted in few weeks.</p><br />\n Cordialement, <br />\n            L''équipe __[SELLYOURSAAS_NAME]__<br />\n            ----------------------------------------- <br />\n            EMail: __[SELLYOURSAAS_MAIN_EMAIL]__<br />\n</body>\n       ');
INSERT INTO llx_c_email_templates (module,type_template,label,lang,topic,joinfiles,content) VALUES ('sellyoursaas', 'contract',                        'CustomerInstanceUgraded',         'fr_FR','[__[SELLYOURSAAS_NAME]__] - Mise à jour de l''instance __REFCLIENT__',   0, '<body>\n <p>Cher utilisateur/utilisatrice __[SELLYOURSAAS_NAME]__,<br><br>\nWe wish to inform you your instance has been upgraded to last stable version. If you experience problem after this upgrade, you can contact us at __[SELLYOURSAAS_MAIN_EMAIL]__ </p><br />\n Sincerly, <br /> \n               The __[SELLYOURSAAS_NAME]__ Team <br />\n            ----------------------------------------- <br />\n            EMail: __[SELLYOURSAAS_MAIN_EMAIL]__<br />\n</body>\n       ');


